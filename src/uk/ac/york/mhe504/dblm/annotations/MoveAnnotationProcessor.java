package uk.ac.york.mhe504.dblm.annotations;

import java.util.ArrayList;
import java.util.List;

/**
 * A class to process MOVE annotations
 * 
 * @author mhe504@york.ac.uk
 */
public class MoveAnnotationProcessor extends AbstractAnnotationProcessor {
	
	private String[][] moveStatements;
	
	public MoveAnnotationProcessor (List<String> modelFileLines){
		setModelFileLines(modelFileLines);
	}
	
	public void getMoveAnnotations() {
		
		final List<String> mvln = new ArrayList<>();
		final List<String> mvs = new ArrayList<>();
		
		for(int i = 0; i < modelFileLines.size(); i++)
		{
			String ln = modelFileLines.get(i);
			if (ln.contains(ANNOTATION_WRAPPER_CHAR + MOVE_STATEMENT_TYPE))
				addStatementsToList(MOVE_STATEMENT_TYPE, mvln, mvs, i, ln);
		}
		moveStatements = new  String[mvln.size()][2];
		for (int i = 0; i<mvln.size();i++)
		{
			moveStatements[i][0] = mvln.get(i);
			moveStatements[i][1] = mvs.get(i);
		}
		
	}
	
	public boolean executeMoveAnnotations() {
		boolean statementsMoved = false;
		for(int i=0; i < moveStatements.length; i++)
		{
			statementsMoved=true;
			int lineNo = Integer.parseInt(moveStatements[i][0]);
			String statement = moveStatements[i][1];
			 moveStatements[i][0] = null;
			 moveStatements[i][1] = null;
			
			String[] array = statement.replace(MOVE_STATEMENT_TYPE + START_CHAR, "").split(FIELD_SEPERATOR_CHAR);
			String modelElementName =array[0];
			String modelElementType = array[1];
			int insertAt = -1;
			if (array.length ==3)
			{
				String xsiType = array[2].trim();
				insertAt= getInsertionLine(modelElementType,modelElementName,"xsi:type=\"" + xsiType + "\"") -1;
			}
			else
			{
				insertAt= getInsertionLine(modelElementType,modelElementName,"");
			}
			
			if (insertAt != -1)
			{
				if ("itemUnit".equals(modelElementType))
				{
					String ln1 = modelFileLines.get(insertAt).replace("/>", ">");
					String ln2 = modelFileLines.remove(lineNo).replace(ANNOTATION_WRAPPER_CHAR + statement + ANNOTATION_WRAPPER_CHAR, "");
					String ln3 = "</itemUnit>";
					modelFileLines.set(insertAt-1,ln1);
					modelFileLines.add(insertAt,ln2);
					modelFileLines.add(insertAt+1,ln3);
				}
				else
				{
					modelFileLines.add(insertAt,modelFileLines.remove(lineNo).replace(ANNOTATION_WRAPPER_CHAR + statement + ANNOTATION_WRAPPER_CHAR, ""));					
				}
				if (lineNo < insertAt)
				{
					updateLineNumbers(lineNo,moveStatements);
				}				
			}
			else{
				System.out.println("Error: Could not execute move annotation '" + moveStatements[i][1] + "' on line " + moveStatements[i][0] + ".The insertion line was not found.");
				modelFileLines.set(Integer.parseInt(moveStatements[i][0]), "<!--" + modelFileLines.get(Integer.parseInt(moveStatements[i][0])) + "-->");
			}
		}
		System.out.println(moveStatements.length + " move statements executed");
		return statementsMoved;
	}
}
