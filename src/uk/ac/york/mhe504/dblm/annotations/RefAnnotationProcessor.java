package uk.ac.york.mhe504.dblm.annotations;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * A class to process REF annotations
 * 
 * @author mhe504@york.ac.uk
 */
public class RefAnnotationProcessor extends AbstractAnnotationProcessor implements Runnable {

	private String[][] refStatements;
	private Map<String, Integer> typeReferenceCache = new HashMap<String, Integer>();
	
	public RefAnnotationProcessor (List<String> modelFileLines,String[][] refStatements)
	{
		setModelFileLines(modelFileLines);
		this.refStatements = refStatements;
	}

	@Override
	public void run() {
		for (int i = 0; i < refStatements.length; i++) {

			int lineNo = Integer.parseInt(refStatements[i][0]);
			String statement = refStatements[i][1];

			String fieldName = statement.replace(
					REF_STATEMENT_TYPE + START_CHAR, "").split(
					FIELD_SEPERATOR_CHAR)[0];
			String namePath = statement.replace(
					REF_STATEMENT_TYPE + START_CHAR, "").split(
					FIELD_SEPERATOR_CHAR)[1];
			String typePath = statement.replace(
					REF_STATEMENT_TYPE + START_CHAR, "").split(
					FIELD_SEPERATOR_CHAR)[2];

			String[] names = namePath.split("\\.");
			String[] types = typePath.split("\\.");

			String existingLine = getModelFileLines().get(lineNo);
			String reference = "";

			if (types.length == 2) {
				int element1position, element2position;
				if ("this".equals(names[0])) {
					String parentTableName = getModelFileLines().get(lineNo - 1)
							.split("name=\"")[1].replace("\">", "");
					for (int a = lineNo; a > 0; a--) {
						if (getModelFileLines()
								.get(a)
								.contains(
										"dataElement xsi:type=\"data:RelationalTable\"")) {
							parentTableName = getModelFileLines().get(a).split(
									"name=\"")[1].replace("\">", "");
							a = 0;
						}
					}
					element1position = findTablePosition(parentTableName);
					element2position = findChildElementPosition(
							parentTableName, types[0], names[1], types[1]);
				} else {
					int[] positions = findPositions(names[0], "<" + types[0], "", names[1], types[1]);
					element1position = positions[0];
					element2position = positions[1];
				}

				reference = "//@" + types[0] + "." + element1position + "/@"
						+ types[1] + "." + element2position + "  ";
			}
			else if (types.length == 3) {
				int model, languageUnit, type;
				model = 1;
				languageUnit = 0;
				
				Integer result =  typeReferenceCache.get(names[1]+ types[1]+ names[2]+types[2]);
				if (result != null)
					type = result;
				else
				{
					type = findChildElementPosition(names[1], types[1], names[2],types[2]);	
					typeReferenceCache.put(names[1]+ types[1]+ names[2]+types[2], type);
				}
				reference = "//@" + types[0] + "." + model + "/@" + types[1]+ "." + languageUnit + "/@" + types[2] + "." + type;
				
			} else if (types.length == 4) {
				int element1position, element2position, element3position, element4position;
				if ("this".equals(names[2])) {
					String parentTableName = getModelFileLines().get(lineNo - 1)
							.split("name=\"")[1].replace("\">", "");
					for (int a = lineNo; a > 0; a--) {
						if (getModelFileLines().get(a).contains("dataElement xsi:type=\"data:RelationalTable\"")) {
							parentTableName = getModelFileLines().get(a).split(
									"name=\"")[1].replace("\">", "");
							a = 0;
						}
					}

					element1position = element2position = 0;
					int[] positions = findPositions(parentTableName,"xsi:type=\"data:RelationalTable\"", types[2], names[3], types[3]);
					element3position = positions[0];
					element4position = positions[1];

				}
				else
				{

					element1position = element2position = 0;
					int[] positions = findPositions(names[2],"xsi:type=\"data:RelationalTable\"", types[2], names[3], types[3]);
					element3position = positions[0];
					element4position = positions[1];
					
				}
				reference = "//@" + types[0] + "." + element1position
						+ "/@" + types[1] + "." + element2position + "/@"
						+ types[2] + "." + element3position + "/@"
						+ types[3] + "." + element4position + "  ";

			}
			String[] existingLineParts = existingLine
					.split(ANNOTATION_WRAPPER_CHAR);
			if (existingLineParts[existingLineParts.length - 1]
					.contains(fieldName)) {
				existingLineParts[existingLineParts.length - 1] = existingLineParts[existingLineParts.length - 1]
						.replace("\"/>", reference + " \"/>");
			} else {
				int insertPos1 = existingLineParts[existingLineParts.length - 1]
						.indexOf("/>");
				int insertPos2 = existingLineParts[existingLineParts.length - 1]
						.indexOf(">");
				String terminator = "";
				if (insertPos1 != -1) {
					terminator = existingLineParts[existingLineParts.length - 1]
							.substring(insertPos1);
				} else if (insertPos2 != -1) {
					terminator = existingLineParts[existingLineParts.length - 1]
							.substring(insertPos2);
				}
				existingLineParts[existingLineParts.length - 1] = existingLineParts[existingLineParts.length - 1]
						.replace(terminator, " " + fieldName + "=\""
								+ reference + "\"" + terminator);
			}
			String replacementLine = "";
			for (String s : existingLineParts) {
				if (!s.contains(statement)) {
					if (s.contains(REF_STATEMENT_TYPE))
						replacementLine = replacementLine
								+ ANNOTATION_WRAPPER_CHAR + s
								+ ANNOTATION_WRAPPER_CHAR;
					else
						replacementLine = replacementLine + s;
				}
			}

			getModelFileLines().set(lineNo, replacementLine);
		}
		
	}

}