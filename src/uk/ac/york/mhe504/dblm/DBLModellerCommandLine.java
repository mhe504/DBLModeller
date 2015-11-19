package uk.ac.york.mhe504.dblm;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.tools.ant.Project;

import gts.modernization.interpreter.Gra2MoLInterpreter;
import gts.modernization.model.CST.CSTFactory;
import gts.modernization.model.CST.Element;
import gts.modernization.model.CST.Leaf;
import gts.modernization.model.CST.Node;
import gts.modernization.model.Gra2MoL.Core.ViewDefinition;
import gts.modernization.util.Gra2MoLDinamicInterpreterAntTask;
import uk.ac.york.mhe504.dblm.datacapture.OJDBCLogProcessor;
import uk.ac.york.mhe504.dblm.datacapture.WikipediaLogProcessor;

/**
 * This provides a command line interface for DBLModeller
 * 
 * @author mhe504@york.ac.uk
 *
 */

public final class DBLModellerCommandLine {

	public static void main(String[] args) throws Exception {
		
		if (args.length == 3)
		{
			if ("-extract".equals(args[0])){
				
				createTempoaryFiles(new String[]{"/sqlddl-to-kdm.g2m","/csv-to-smm.g2m","/kdm.ecore","/smm.ecore"});
				
				t2mTransformation("DDL","statements", "sqlddl-to-kdm.g2m", args[1],
						"kdm.ecore", "KDM", "StructureModel.xmi");
				new ModelRefiner().execute("StructureModel.xmi");
		
				t2mTransformation("CSV","logfile","csv-to-smm.g2m", args[2],
						"smm.ecore", "SMM", "WorkloadModel.xmi");
				new ModelRefiner().execute("WorkloadModel.xmi");
				
				deleteTempoaryFiles(new String[]{"sqlddl-to-kdm.g2m","csv-to-smm.g2m","kdm.ecore","smm.ecore", "debug.txt",
						"gra2molModel.ecore", "CSTModel.ecore"});
			}
			else if ("-logprocess".equals(args[0])){
				new OJDBCLogProcessor().execute(new File(args[1]), args[2]);
			}
			else{
				printHelp();
			}

		}
		else if (args.length == 2)
		{
			if ("-wikipedia".equals(args[0])){
				new WikipediaLogProcessor().execute(args[1]);
			}
		}
		else{
			printHelp();
		}

	}
	
	  private static void deleteTempoaryFiles(String[] targets) {
		  
		  for (String target: targets)
			  new File(target).delete();	
	}

	private static void createTempoaryFiles(String[] targets) throws IOException {
		
		for (String target: targets)
		{
			InputStream stream = null;
			OutputStream resStreamOut = null;
			String jarFolder;
			try {
				stream = DBLModellerCommandLine.class.getResourceAsStream(target);
				if(stream == null) {
					throw new Exception("Cannot get resource \"" + target + "\" from Jar file.");
				}

				int readBytes;
				byte[] buffer = new byte[4096];
				jarFolder = new File(DBLModellerCommandLine.class.getProtectionDomain().getCodeSource()
									.getLocation().toURI().getPath()).getParentFile().getPath().replace('\\', '/');
				resStreamOut = new FileOutputStream(jarFolder + target);
				while ((readBytes = stream.read(buffer)) > 0) {
					resStreamOut.write(buffer, 0, readBytes);
				}
			} catch (Exception e) {
				System.out.println(e);
			} finally {
				stream.close();
				resStreamOut.close();
			}

		}
		
	}

	private static void printHelp() {
		System.out.println("Incorrect number of arguments");
		System.out.println("Usage:");
		System.out.println("\t -extract sql_file_name measurements_file_name");
		System.out.println("\t -logprocess ojdbc.log entity_name");
	}
	
	public static void t2mTransformation(String grammar, String gammarMainRule, 
										 String transformationRules, String targetFile,
										 String metamodelPath, String metamodelName,
										 String result)
	{
		System.out.println("T2M Transformation: " + targetFile + " to " + metamodelName);
		long startTime = System.currentTimeMillis();
		
		Gra2MoLDinamicInterpreterAntTask t2m_kdm = new Gra2MoLDinamicInterpreterAntTask();
		t2m_kdm.setPathSourceView(transformationRules);
		t2m_kdm.setPathMetamodel(metamodelPath);
		t2m_kdm.setTargetMetamodel(metamodelName);
		t2m_kdm.setClassName(grammar + "Test");
		t2m_kdm.setResult(result);
		t2m_kdm.setGrammar(grammar);
		t2m_kdm.setMainRule(gammarMainRule);
		t2m_kdm.setCaseSensitive(true);
		t2m_kdm.setProject(new Project());
		
		Element globalCST;
	    ViewDefinition view = t2m_kdm.loadView(t2m_kdm.getPathSourceView());
	    t2m_kdm.saveView("gra2molModel.ecore", view);
	    try
	    {
			globalCST = t2m_kdm.initializeGlobalCST();

			try
			{
			  Element e = t2m_kdm.parser(targetFile);
			  addCST(e, targetFile, targetFile,globalCST);
			}
			catch (Exception e)
			{
				 e.printStackTrace();
			}

			Gra2MoLDinamicInterpreterAntTask.saveCST("CSTModel.ecore", (Node)globalCST);
			System.out.println(t2m_kdm.getPathMetamodel());
			Gra2MoLInterpreter interpreter = new Gra2MoLInterpreter(globalCST, view, t2m_kdm.getPathMetamodel(), t2m_kdm.getTargetMetamodel(), t2m_kdm.getResult());
			interpreter.execute();
			
			long endTime = System.currentTimeMillis() - startTime;
			System.out.println("Transformation completed in " + endTime + " milisecs\n");
			
	    } catch (Exception ex){
	        ex.printStackTrace();
	    }
	}
	
	  
	private static void addCST(Element specific, String path, String filename, Element globalCST)
	{
		if (((globalCST instanceof Node)) && ((specific instanceof Node)))
		{
			Node globalNode = (Node)globalCST;
			Node specficidNode = (Node)specific;
			
			Node file = CSTFactory.eINSTANCE.createNode();
			file.setKind("file");
		  
			Leaf pathLeaf = CSTFactory.eINSTANCE.createLeaf();
			pathLeaf.setKind("path");
			pathLeaf.setValue(path);
		  
			Leaf pathFileName = CSTFactory.eINSTANCE.createLeaf();
			pathFileName.setKind("filename");
			pathFileName.setValue(filename);
			  
			file.getChildren().add(pathLeaf);
			file.getChildren().add(pathFileName);
			file.getChildren().add(specficidNode);
			 
			globalNode.getChildren().add(file);
		}
	}

}
