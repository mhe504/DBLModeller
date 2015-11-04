package uk.ac.york.mhe504.dblm;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import uk.ac.york.mhe504.dblm.annotations.AbstractAnnotationProcessor;
import uk.ac.york.mhe504.dblm.annotations.AddAnnotationProcessor;
import uk.ac.york.mhe504.dblm.annotations.MoveAnnotationProcessor;
import uk.ac.york.mhe504.dblm.annotations.RefAnnotationProcessor;

/**
 * This class executes annotated KDM and SMM models 
 * 
 * @author mhe504@york.ac.uk
 *
 */
public class ModelRefiner{
	
	private List<String> targetModel = new ArrayList<>();
	private String modelPath;
	private String[][] addAnnotations, refAnnotations;
		
	public void execute(String path){
		
		System.out.println("Model Refinement: executing annoations in " + path + ".");
		long startTime = System.currentTimeMillis();

		modelPath = path.equals("") ? "DDLModel.xmi" : path;
		
		loadModel();	
		
		MoveAnnotationProcessor ma = new MoveAnnotationProcessor(targetModel);
		ma.getMoveAnnotations();
		boolean modelElementsMoved = ma.executeMoveAnnotations();
		

		getNonMoveAnnotations();
		executeNonMoveAnnotations(modelElementsMoved);
		
		saveModel();
		long endTime = System.currentTimeMillis() - startTime;
		System.out.println("Model Refinement in " + endTime + " milisecs\n");
	}
	

	private void loadModel() {
		try {
			targetModel = Files.readAllLines(Paths.get(modelPath), Charset.forName("ISO-8859-1"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void getNonMoveAnnotations() {
		final List<String> addln = new ArrayList<>();
		final List<String> refln = new ArrayList<>();
		final List<String> adds = new ArrayList<>();
		final List<String> refs = new ArrayList<>();
		
		for(int i = 0; i < targetModel.size(); i++)
		{
			String ln = targetModel.get(i);
			if (ln.contains(AbstractAnnotationProcessor.ANNOTATION_WRAPPER_CHAR + AbstractAnnotationProcessor.ADD_STATEMENT_TYPE))
				addAnnotationsToList(AbstractAnnotationProcessor.ADD_STATEMENT_TYPE, addln, adds, i, ln);
			if (ln.contains(AbstractAnnotationProcessor.ANNOTATION_WRAPPER_CHAR + AbstractAnnotationProcessor.REF_STATEMENT_TYPE))
			{
				addAnnotationsToList(AbstractAnnotationProcessor.REF_STATEMENT_TYPE, refln, refs, i, ln);
			}
		}
		addAnnotations = new String[addln.size()][2];
		for (int i = 0; i<addln.size();i++)
		{
			addAnnotations[i][0] = addln.get(i);
			addAnnotations[i][1] = adds.get(i);
		}
		
		refAnnotations = new  String[refln.size()][2];
		for (int i = 0; i<refln.size();i++)
		{
			refAnnotations[i][0] = refln.get(i);
			refAnnotations[i][1] = refs.get(i);
		}
		
	}

	private void addAnnotationsToList(String type, List<String> linenos,
			List<String> statemnts, int i, String ln) {
		String[] lineParts = ln.split(AbstractAnnotationProcessor.ANNOTATION_WRAPPER_CHAR);
		for (String part : lineParts)
		{
			if (part.contains((AbstractAnnotationProcessor.ANNOTATION_WRAPPER_CHAR + type).substring(1)))
			{
				linenos.add(Integer.toString(i));
				statemnts.add(part);						
			}
		}
	}
	
	private void executeNonMoveAnnotations(boolean statementsMoved) {
		
		executeAddAnnotations(statementsMoved);
		System.out.println(addAnnotations.length + " add statements executed");
		executeRefAnnotations();
		System.out.println(refAnnotations.length + " reference statements executed");
		
	}

	private void executeAddAnnotations(boolean statementsMoved) {
		AddAnnotationProcessor aa = new AddAnnotationProcessor(targetModel, addAnnotations, refAnnotations, statementsMoved);
		aa.executeAddAnnotations();
	}
	
	private void executeRefAnnotations()	
	{
		//Divide the Ref Annotations between two threads then execute
		
		double splitPoint = Double.valueOf(refAnnotations.length)/2;

		String[][] refAnnotationsPt1 = new String[(int) Math.floor(splitPoint)][2];
		System.arraycopy(refAnnotations, 0, refAnnotationsPt1, 0, refAnnotationsPt1.length);
		
		Thread refAnnotationsThread1 = new Thread(new RefAnnotationProcessor(targetModel, refAnnotationsPt1));
		refAnnotationsThread1.start();
		
		String[][] refAnnotationsPt2 = new String[(int) Math.ceil(splitPoint)][2];
		System.arraycopy(refAnnotations, refAnnotationsPt1.length, refAnnotationsPt2, 0, refAnnotationsPt2.length);

		Thread refAnnotationsThread2 = new Thread(new RefAnnotationProcessor(targetModel, refAnnotationsPt2));
		refAnnotationsThread2.start();
		
		try {
			refAnnotationsThread1.join();
			refAnnotationsThread2.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	private void saveModel() {
		try {
			PrintWriter writer = new PrintWriter(new File(modelPath));
			
			for (String line : targetModel)
			{
				writer.println(line);
			}
			writer.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
	}
}