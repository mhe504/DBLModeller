package uk.ac.york.mhe504.dblm.annotations;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * An Abstract class to be extended by all AnnotationProccessor classes,
 * which provides functionality to search a textual model.
 * 
 * @author mhe504@york.ac.uk
 *
 */
public abstract class AbstractAnnotationProcessor {
	
	protected List<String> modelFileLines;
	private Map<String,String> cache = new HashMap<String,String>(); 

	public static final String ANNOTATION_WRAPPER_CHAR = ";";
	public static final String START_CHAR = ":";
	public static final String FIELD_SEPERATOR_CHAR = ",";

	public static final String REF_STATEMENT_TYPE = "POSTPROCESS_REF";
	public static final String MOVE_STATEMENT_TYPE = "POSTPROCESS_MOVE";
	public static final String ADD_STATEMENT_TYPE = "POSTPROCESS_ADD";
	public static final String ADD_HERE_CHAR = "H";
	public static final String ADD_ALL_CHAR = "*";
	
	protected int[] findPositions(String root_element_name, String root_element_xsitype, String root_element_type, String child_element_name, String child_element_type) {
		
		int parentPosition,childPosition;
		parentPosition = childPosition = -1;
		
		//If the child_element_name is a tag rather than XSI type, append a starting character
		if (!child_element_type.contains(":"))
			child_element_type = "<" + child_element_type;

		int position = 0;
		for (String line : getModelFileLines()) {
			if (line.contains(root_element_xsitype)) {
				if (line.contains("name=\"" + root_element_name + "\"") && parentPosition == -1) {
					parentPosition = position;
					position = 0;
				} else if (parentPosition == -1) {
					position++;
				}
			}
				
			if (parentPosition != -1){
				if (line.contains(child_element_type)){
					if (line.contains("name=\"" + child_element_name))
					{
						childPosition = position;
						return new int[]{parentPosition,childPosition};
					}
					else if (!line.contains("name=\"" + root_element_name+ "\""))
					{
						position++;						
					}
				}
			}
			
		}
		
		return null;
	}
	
	protected int findChildElementPosition(String root_element_name,
			String root_element_type, String child_element_name,
			String child_element_type) {

		int position = 0;
		boolean isLinePartofTable = false;
		for (String line : getModelFileLines()) {
			if (line.contains("<" + root_element_type) && line.contains("name=\"" + root_element_name + "\""))
				isLinePartofTable = true;
			if (isLinePartofTable && line.contains("</" + root_element_type + ">"))
				isLinePartofTable = false;

			if (isLinePartofTable)
				if (line.contains("<" + child_element_type))
					if (line.contains("name=\"" + child_element_name))
						return position;
					else if (!line.contains("name=\"" + root_element_name+ "\""))
						position++;

		}

		
		return position;
	}

	protected int findTablePosition(String name) {
		int position = 0;

		for (String line : getModelFileLines()) {
			if (line.contains("xsi:type=\"data:RelationalTable\"")) {
				if (line.contains("name=\"" + name)) {
					return position;
				} else {
					position++;
				}
			}
		}
		return -1;
	}

	protected List<String> getModelFileLines() {
		return modelFileLines;
	}

	protected void setModelFileLines(List<String> modelFileLines) {
		this.modelFileLines = modelFileLines;
	}

	protected String getReferenceToChildElement(String parentName, String parentType, String childName, String childType) {
		
		if (cache.get(parentName + "," + parentType + "," + childName + "," + childType) != null)
			return cache.get(parentName + "," + parentType + "," + childName + "," + childType);
		
		String referenceName = "";
		String ref = "@" + childType + "." + findChildElementPosition(parentName,parentType,childName,childType);
		
		boolean isLinePartofTable = false;
		for (String ln : modelFileLines)
		{
			if (ln.contains("<" + parentType) && ln.contains("name=\"" + parentName + "\""))
				isLinePartofTable = true;
			if (isLinePartofTable && ln.contains("</" + parentType + ">"))
				isLinePartofTable = false;
			
			if(isLinePartofTable)
					if (ln.contains(ref))
					{
						referenceName =  ln.split("name=\"")[1];
						referenceName = referenceName.substring(0,referenceName.indexOf('"'));
						cache.put(parentName + "," + parentType + "," + childName + "," + childType, referenceName);
						return referenceName;
					}
			
		}

		cache.put(parentName + "," + parentType + "," + childName + "," + childType, referenceName);
		return referenceName;
		
	}
	
	protected String getUnResolvedReferenceToChildElement(String parentName, String parentType, String childName, String childType) {
		String referenceName = "";
		
		boolean isLinePartofTable = false;
		for (String ln : modelFileLines)
		{
			if (ln.contains("<" + parentType) && ln.contains("name=\"" + parentName + "\""))
				isLinePartofTable = true;
			if (isLinePartofTable && ln.contains("</" + parentName + ">"))
				isLinePartofTable = false;
			
			if(isLinePartofTable)
					if (ln.contains(childName) && ln.contains(childType) && ! ln.contains("name=\"" + parentName + "\""))
					{
						referenceName =  ln.split("name=\"")[1];
						return referenceName.substring(0,referenceName.indexOf('"'));
					}
			
		}

		
		
		return referenceName;
		
	}
	
	protected String getReferenceToChildElement(String parentName, String parentType, String childName) {
		String referenceName = "";
		
		boolean isLinePartofTable = false;
		for (String ln : modelFileLines)
		{
			if (ln.contains("<" + parentType) && ln.contains("name=\"" + parentName + "\""))
				isLinePartofTable = true;
			if (isLinePartofTable && ln.contains("</" + parentName + ">"))
				isLinePartofTable = false;
			
			if(isLinePartofTable)
					if (ln.contains(childName) && ! ln.contains("name=\"" + parentName + "\""))
					{
						referenceName =  ln.split("name=\"")[1];
						return referenceName.substring(0,referenceName.indexOf('"'));
					}
			
		}

		
		
		return referenceName;
		
	}
	
	protected void decrementAllLineNumbers(int removeAt, String[][] statements) {
		 for(int i=0; i < statements.length; i++)
			 if (Integer.parseInt(statements[i][0]) > removeAt)
				 statements[i][0] = Integer.toString(Integer.valueOf(statements[i][0])-1);
		
	}

	protected void incrementAllLineNumbers(int lineNo, String[][] statements) {
		 for(int i=0; i < statements.length; i++)
			 if (Integer.parseInt(statements[i][0]) > lineNo)
				 statements[i][0] = Integer.toString(Integer.valueOf(statements[i][0])+1);	
	}


	protected boolean isDuplicateLine(String newline) {
		
		for (String ln : modelFileLines)
		{
			if (ln.replace(" ", "").contains(newline.replace(" ", "")))
				return true;
		}
		
		return false;
	}

	protected int findChildElementPositionByXSIType(String root_element_name, String root_element_type, String child_element_name, String child_element_xsi_type) {
		
		int position = 0;
		boolean isLinePartofTable = false;
		for (String line : modelFileLines)
		{
			if (line.contains("<" + root_element_type) && line.contains("name=\"" + root_element_name + "\""))
				isLinePartofTable = true;
			if (isLinePartofTable && line.contains("</" + root_element_type + ">")){
				isLinePartofTable = false;
				System.out.println("findChildElementPositionByXSIType(" + root_element_name + ", " +  root_element_type  + ", " + child_element_name + ", " +  child_element_xsi_type + ")");
				System.out.println("Error: Reached end of table, " + child_element_name + " was not found.");
			}
			
			if(isLinePartofTable)
				if (line.contains("xsi:type=\"" + child_element_xsi_type) && line.contains("name=\"" + child_element_name))
					return position;
				else if (!line.contains("name=\"" + root_element_name + "\"") && line.contains(root_element_type))
					position++;
			
		}
		
		return position;
	}
	
	protected void addStatementsToList(String type, List<String> linenos,
			List<String> statemnts, int i, String ln) {
		String[] lineParts = ln.split(ANNOTATION_WRAPPER_CHAR);
		for (String part : lineParts)
		{
			if (part.contains((ANNOTATION_WRAPPER_CHAR + type).substring(1)))
			{
				linenos.add(Integer.toString(i));
				statemnts.add(part);						
			}
		}
	}
	

	protected void updateLineNumbers(int lineNo, String[][] statements) {
		 for(int i=0; i < statements.length; i++)
		 {
			 if (statements[i][0] != null)
			 {
				 String target = statements[i][1];
				 for (int j = 0; j < modelFileLines.size(); j++)
				 {
					 if(modelFileLines.get(j).contains(target))
					 {
						 statements[i][0] = Integer.toString(j);
					 }
				 }
			 }
		 }
		
	}
	
	protected int getInsertionLine(String type, String name, String xsitype) {
		
		if (name.contains("."))
		{
			//find parent
			for (int lineNo = 0; lineNo < modelFileLines.size(); lineNo++){
				String line = modelFileLines.get(lineNo);
				if (line.contains("name=\"" + name.split("\\.")[0] + "\"") && line.contains("data:RelationalTable"))
				{
					//find child
					do {
						lineNo++;
						line = modelFileLines.get(lineNo);
					} while(!(line.contains("name=\"" + name.split("\\.")[1]) && line.contains(type)));
					return lineNo;
					
				}
			}
		}
		else
		{
			for (int lineNo = 0; lineNo < modelFileLines.size(); lineNo++)
			{
				if (lineNo == 4000)
					System.out.println("STOP");
				String line = modelFileLines.get(lineNo);
				if (line.contains("name=\"" + name + "\"") && line.contains(type) && line.contains(xsitype))
				{
					do {
						lineNo++;
					} while(!modelFileLines.get(lineNo).contains("</" + type + ">"));
					return lineNo;
				}
				else if (xsitype.equals("") && line.contains("name=\"" + name) && line.contains(type))
				{
					return lineNo;
				}
			}
		}
		
		return -1;
	}
}
