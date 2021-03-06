package uk.ac.york.mhe504.dblm.annotations;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

/**
 * A class to process ADD annotations
 * 
 * @author mhe504@york.ac.uk
 */
public class AddAnnotationProcessor extends AbstractAnnotationProcessor {
	private String[][] addStatements, refStatements;
	private boolean statementsMoved = false;
	
	public AddAnnotationProcessor (List<String> modelFileLines, String[][] addStatements, String[][] refStatements, boolean statementsMoved)
	{
		setModelFileLines(modelFileLines);
		this.addStatements = addStatements;
		this.refStatements = refStatements;
		this.statementsMoved = statementsMoved;
	}
	
	public void executeAddAnnotations() {
		String[][] addStatements2 =  new String[addStatements.length][2];
		int x=0;
		
		for(int i=0; i < addStatements.length; i++)
		{
			if (addStatements[i][1].contains("ADD:"))
			{
				addStatements2[x][0] = addStatements[i][0];
				addStatements2[x][1] = addStatements[i][1];
				x++;
			}
		}
		for(int i=0; i < addStatements.length; i++)
		{
			if (addStatements[i][1].contains("ADDH:"))
			{
				addStatements2[x][0] = addStatements[i][0];
				addStatements2[x][1] = addStatements[i][1];
				x++;
			}
		}
		addStatements=addStatements2;
		for(int i=0; i < addStatements.length; i++)
		{
			
			if (addStatements[i][1].contains(ADD_STATEMENT_TYPE + ADD_HERE_CHAR))
			{
				String[] statement = addStatements[i][1].replace(ADD_STATEMENT_TYPE + ADD_HERE_CHAR + START_CHAR, "").split(FIELD_SEPERATOR_CHAR);
				String new_elem_name= statement[0];
				String new_elem_type = statement[1];
				String new_elem_xsitype = statement[2];
				String new_elem_ref_property_1_name =statement[3];
				String new_elem_ref_property_1_value =statement[4];
				
				int currentLineNo = Integer.parseInt(addStatements[i][0]);
				for (int k = currentLineNo; k >= 0; k--)
				{
					String ln = modelFileLines.get(k);
					if (ln.contains("<dataElement xsi:type=\"data:RelationalTable\""))
					{
						String parentTableName = ln.substring(ln.indexOf("name=\"")+6);
						parentTableName = parentTableName.substring(0,parentTableName.indexOf("\""));
						new_elem_ref_property_1_value = parentTableName + "." + new_elem_ref_property_1_value;
						k=0;
					}
				}
				
				//Two Reference Properties
				if (statement.length == 8)
				{

					String new_elem_ref_property_2_name =statement[5];
					String new_elem_ref_property_2_value =statement[6];
				
					int model, schema, table,row;
					
					model = schema = 0;
					table = findTablePosition(new_elem_ref_property_1_value.split("\\.")[0]);
					String refferingElementName = getReferenceToChildElement(new_elem_ref_property_2_value.split("\\.")[0], new_elem_type ,new_elem_ref_property_2_value.split("\\.")[1]);
					row = findChildElementPositionByXSIType(new_elem_ref_property_2_value.split("\\.")[0], new_elem_type,refferingElementName,"data:UniqueKey");
					String ref1 = "//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@dataElement." + row;

					table = findTablePosition(new_elem_ref_property_1_value.split("\\.")[0]);
					refferingElementName = getUnResolvedReferenceToChildElement(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type ,new_elem_ref_property_1_value.split("\\.")[1],"data:ReferenceKey");
					row = findChildElementPositionByXSIType(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type,refferingElementName.split(";")[0],"data:ReferenceKey");
					String ref2 = "//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@dataElement." + row;
					
					String newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" " + new_elem_ref_property_1_name 
							 + "=\"" + ref2 + "\" " + new_elem_ref_property_2_name + "=\"" + ref1 + "\"/>";

					modelFileLines.add(currentLineNo+1,newline);
					incrementAllLineNumbers(currentLineNo,addStatements);
					incrementAllLineNumbers(currentLineNo,refStatements);
					
				}
				else
				{
					String newline = "";
					String ref_tag =statement[5];
					int model, schema, table,row;
					model = schema = 0;
					
					if (StringUtils.countMatches(new_elem_ref_property_1_value, " AND ") == 1)
					{
						String row1name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[0].replace("(", "");
						String row2name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[1].replace(")", "");
						int[] positions = findPositions(new_elem_ref_property_1_value.split("\\.")[0],"xsi:type=\"data:RelationalTable\"", new_elem_type, row1name, ref_tag);
						table = positions[0];
						row = positions[1];
						
						int row2 = findChildElementPosition(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type, row2name, ref_tag);
						newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
								"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row +
								"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row2 + "\"/>";

					}
					else if (StringUtils.countMatches(new_elem_ref_property_1_value, " AND ") == 2)
					{
						String row1name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[0].replace("(", "");
						int[] positions = findPositions(new_elem_ref_property_1_value.split("\\.")[0],"xsi:type=\"data:RelationalTable\"", new_elem_type, row1name, ref_tag);
						table = positions[0];
						row = positions[1];
						String row2name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[1];
						String row3name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[2].replace(")", "");
						int row2 = findChildElementPosition(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type, row2name, ref_tag);
						int row3 = findChildElementPosition(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type, row3name, ref_tag);
						
						newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
								"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row +
								"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row2 + 
								"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row3 + "\"/>";

					}
					else if (StringUtils.countMatches(new_elem_ref_property_1_value, " AND ") == 3)
					{
						String row1name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[0].replace("(", "");
						int[] positions = findPositions(new_elem_ref_property_1_value.split("\\.")[0],"xsi:type=\"data:RelationalTable\"", new_elem_type, row1name, ref_tag);
						table = positions[0];
						row = positions[1];

						String row2name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[1];
						String row3name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[2];
						String row4name = new_elem_ref_property_1_value.split("\\.")[1].split(" AND ")[3].replace(")", "");
						
						int row2 = findChildElementPosition(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type, row2name, ref_tag);
						int row3 = findChildElementPosition(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type, row3name, ref_tag);
						int row4 = findChildElementPosition(new_elem_ref_property_1_value.split("\\.")[0], new_elem_type, row4name, ref_tag);
						
						newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
								"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row +
								"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row2 +
								"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row3 +
								"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row4 + "\"/>";

					}
					else
					{						
						int[] positions = findPositions(new_elem_ref_property_1_value.split("\\.")[0],"xsi:type=\"data:RelationalTable\"", new_elem_type, new_elem_ref_property_1_value.split("\\.")[1], ref_tag);
						table = positions[0];
						row = positions[1];
						
						newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
								"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row + "\"/>";
						
					}
					modelFileLines.remove(currentLineNo);
					modelFileLines.add(currentLineNo,newline);
					
				}

			}
			else
			{
				//Get related statements
				List<List<String>> statementGroup = new ArrayList<>();
				if (addStatements[i][1].contains(ADD_ALL_CHAR))
				{
					do
					{
						List<String> lst = new ArrayList<String>();
						lst.add(addStatements[i][0]);
						lst.add(addStatements[i][1]);
						statementGroup.add(lst);
						i++;
					} while (i <  addStatements.length && !addStatements[i][1].contains(ADD_ALL_CHAR) && addStatements[i][1].contains("ADD:"));
					i--;	
				}
				else
				{
					List<String> lst = new ArrayList<String>();
					lst.add(addStatements[i][0]);
					lst.add(addStatements[i][1]);
					statementGroup.add(lst);
				}

				
				if (statementGroup.size() > 1)
				{
					List<Integer> linesToRemove = new ArrayList<Integer>();
					String nodeStatement = statementGroup.get(0).get(1);
					linesToRemove.add(Integer.parseInt(statementGroup.get(0).get(0)));
					String target_parent_elem_name = nodeStatement.replace(ADD_STATEMENT_TYPE + START_CHAR, "").split(FIELD_SEPERATOR_CHAR)[0];
					String target_parent_elem_type = nodeStatement.replace(ADD_STATEMENT_TYPE + START_CHAR, "").split(FIELD_SEPERATOR_CHAR)[1];
					
					//Child Statements
					for (int j = 1; j < statementGroup.size(); j++)
					{
						String[] leafStatement = statementGroup.get(j).get(1).replace(ADD_STATEMENT_TYPE + START_CHAR, "").split(FIELD_SEPERATOR_CHAR);
						linesToRemove.add(Integer.parseInt(statementGroup.get(j).get(0)));
						
						String new_elem_name = leafStatement[0];
						String new_elem_type = leafStatement[1];
						String new_elem_xsitype = leafStatement[2];
						String new_elem_ref_property_1_name =leafStatement[3];
						String new_elem_ref_property_1_value =leafStatement[4];
						
						//Two Reference Properties
						if (leafStatement.length == 8)
						{
							String new_elem_ref_property_2_name =leafStatement[5];
							String new_elem_ref_property_2_value =leafStatement[6];
							String ref_tag =leafStatement[7];

							int model, schema, table,row;
							
							model = schema = 0;
							int[] positions = findPositions(target_parent_elem_name,"xsi:type=\"data:RelationalTable\"", target_parent_elem_type, new_elem_name, new_elem_type);
							table = positions[0];
							row = positions[1];
							String ref1 = "//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@dataElement." + row;
							
							String type = "itemUnit";
							if ("this".equals(new_elem_ref_property_2_value.split("\\.")[0]))
							{
								int lineNo = Integer.parseInt(statementGroup.get(j).get(0));
								for (int k =lineNo; k > 0; k--)
								{
									if (getModelFileLines().get(k).contains("xsi:type=\"data:RelationalTable\""))
									{
										new_elem_ref_property_2_value = new_elem_ref_property_2_value.replace("this", getModelFileLines().get(k).split("name=\"")[1].replace("\">", ""));
										k=-1;
										type = "dataElement";
									}
								}
							}

							table = findTablePosition(new_elem_ref_property_2_value.split("\\.")[0]);
							
							String refferingElementName = getReferenceToChildElement(new_elem_ref_property_2_value.split("\\.")[0], new_elem_type ,new_elem_ref_property_2_value.split("\\.")[1],type);
							if (refferingElementName.equals("") || !statementsMoved)
							{
								refferingElementName = getUnResolvedReferenceToChildElement(new_elem_ref_property_2_value.split("\\.")[0], new_elem_type ,new_elem_ref_property_2_value.split("\\.")[1],type);
							}
							if (refferingElementName.equals("") || leafStatement[6].contains("this."))
							{
								positions = findPositions(new_elem_ref_property_2_value.split("\\.")[0],"xsi:type=\"data:RelationalTable\"", new_elem_type, new_elem_ref_property_2_value.split("\\.")[1], new_elem_type);
								table = positions[0];
								row = positions[1];
							}
							else
								row = findChildElementPosition(new_elem_ref_property_2_value.split("\\.")[0], new_elem_type,refferingElementName,ref_tag);
							String ref2 = "//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@dataElement." + row;
							String newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" " + new_elem_ref_property_2_name 
									 + "=\"" + ref2 + "\" " + new_elem_ref_property_1_name + "=\"" + ref1 + "\"/>";
						
							int insertAt = getClosingTagLineNo("model");
							insertAt = insertAt - 1;
							modelFileLines.add(insertAt,newline);
							
							incrementAllLineNumbers(insertAt,addStatements);
							incrementAllLineNumbers(insertAt,refStatements);

						
						}
						else //One Reference Property
						{
							String ref_tag =leafStatement[5];
							
							int model, schema, table,row;
							int[] positions;
							String newline = "";
							model = schema = 0;						
							if (!new_elem_ref_property_1_value.contains("AND"))
							{
								positions = findPositions(target_parent_elem_name,"xsi:type=\"data:RelationalTable\"", new_elem_type, new_elem_ref_property_1_value, ref_tag);
								table = positions[0];
								row = positions[1];
							
								newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
										"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row + "\"/>";
							}
							else if (StringUtils.countMatches(new_elem_ref_property_1_value, " AND ") == 1)
							{
								String row1name = new_elem_ref_property_1_value.split(" AND ")[0].replace("(", "");
								String row2name = new_elem_ref_property_1_value.split(" AND ")[1].replace(")", "");
								positions = findPositions(target_parent_elem_name,"xsi:type=\"data:RelationalTable\"", new_elem_type, row1name, ref_tag);
								table = positions[0];
								row = positions[1];
								
								int row2 = findChildElementPosition(new_elem_ref_property_1_value, new_elem_type, row2name, ref_tag);
								newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
										"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row +
										"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row2 + "\"/>";

							}
							else if (StringUtils.countMatches(new_elem_ref_property_1_value, " AND ") == 2)
							{
								String row1name = new_elem_ref_property_1_value.split(" AND ")[0].replace("(", "");
								positions = findPositions(target_parent_elem_name,"xsi:type=\"data:RelationalTable\"", new_elem_type, row1name, ref_tag);
								table = positions[0];
								row = positions[1];
								String row2name = new_elem_ref_property_1_value.split(" AND ")[1];
								String row3name = new_elem_ref_property_1_value.split(" AND ")[2].replace(")", "");
								int row2 = findChildElementPosition(new_elem_ref_property_1_value, new_elem_type, row2name, ref_tag);
								int row3 = findChildElementPosition(new_elem_ref_property_1_value, new_elem_type, row3name, ref_tag);
								
								newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
										"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row +
										"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row2 + 
										"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row3 + "\"/>";

							}
							else if (StringUtils.countMatches(new_elem_ref_property_1_value, " AND ") == 3)
							{
								String row1name = new_elem_ref_property_1_value.split(" AND ")[0].replace("(", "");
								positions = findPositions(target_parent_elem_name,"xsi:type=\"data:RelationalTable\"", new_elem_type, row1name, ref_tag);
								table = positions[0];
								row = positions[1];

								String row2name = new_elem_ref_property_1_value.split(" AND ")[1];
								String row3name = new_elem_ref_property_1_value.split(" AND ")[2];
								String row4name = new_elem_ref_property_1_value.split(" AND ")[3].replace(")", "");
								
								int row2 = findChildElementPosition(new_elem_ref_property_1_value, new_elem_type, row2name, ref_tag);
								int row3 = findChildElementPosition(new_elem_ref_property_1_value, new_elem_type, row3name, ref_tag);
								int row4 = findChildElementPosition(new_elem_ref_property_1_value, new_elem_type, row4name, ref_tag);
								
								newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
										"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row +
										"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row2 +
										"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row3 +
										"  //@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row4 + "\"/>";

							}
							else
							{						
								positions = findPositions(new_elem_ref_property_1_value.split("\\.")[0],"xsi:type=\"data:RelationalTable\"", new_elem_type, new_elem_ref_property_1_value.split("\\.")[1], ref_tag);
								table = positions[0];
								row = positions[1];
								
								newline = "<dataElement xsi:type=\"" + new_elem_xsitype + "\" name=\"" + new_elem_name + "\" " + new_elem_ref_property_1_name + 
										"=\"//@model." + model + "/@dataElement." + schema + "/@dataElement." + table + "/@itemUnit." + row + "\"/>";
								
							}
							//Delete annotations
							if (modelFileLines.get((int)linesToRemove.get(0)).contains("data:RelationalTable"))
							{
								for (int lnr = 0; lnr <= linesToRemove.size(); lnr++)
								{
									int removeAt = (int)linesToRemove.get(0);
									modelFileLines.remove(removeAt);
									decrementAllLineNumbers(removeAt,addStatements);
									decrementAllLineNumbers(removeAt,refStatements);
								}
							}
							else if (linesToRemove.size() != 0)
							{
								int removeAt = (int)linesToRemove.get(0);
								modelFileLines.remove(removeAt);
								decrementAllLineNumbers(removeAt,addStatements);
								decrementAllLineNumbers(removeAt,refStatements);
							}


							if (!isDuplicateLine(newline))
							{
								int insertAt = getInsertionLine("dataElement",target_parent_elem_name, "xsi:type=\"data:RelationalTable\"");

								modelFileLines.add(insertAt,newline);
								
								incrementAllLineNumbers(insertAt,addStatements);
								incrementAllLineNumbers(insertAt,refStatements);
							}
							
						}
					}

				}

			}

			
		}
	}

	private int getClosingTagLineNo(String type) {
		for (int lineNo = 0; lineNo < modelFileLines.size(); lineNo++)
		{
			String line = modelFileLines.get(lineNo);
			if (line.contains(type))
			{
				do {
					lineNo++;
				} while(!modelFileLines.get(lineNo).contains("</" + type + ">"));
				return lineNo;
			}
		}
		return -1;

	}
}
