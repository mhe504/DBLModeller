import java.util.List;

import org.eclipse.emf.common.util.EList;

import gts.modernization.extension.ExtensionValueReturn;
import gts.modernization.extension.MappingExtensionPoint;
import gts.modernization.model.CST.Element;
import gts.modernization.model.CST.Node;


/*
 * This extension takes two input parameters: one column Node, and a list of 
 * column_comment nodes. It then searches the list of column_comment nodes for
 * a column_comment for the current column.
 * 
 */

public class AnnotationExtension extends MappingExtensionPoint {

	@Override
	public ExtensionValueReturn execute() {
		
		//input column (the current one) column_comment (all of them),
		//output column_comment (the current one)
		
		Object param0 =  getParam(0);
		Object param1 =  getParam(1);
		if (param0 instanceof List<?> && param1 instanceof List<?>)
		{
			List<?> columnNodes = (List<?>) getParam(0);
			List<?> columnCommentNodes = (List<?>) getParam(1);
			if (columnNodes.get(0) instanceof Node)
			{
				Node column = (Node) columnNodes.get(0);
				Node columnId = (Node) column.getChildren().get(0);
				String columnName = columnId.getLeaves().get(0).getValue();
				
				//search allAnnotations for ones belonging to the current column
				for (Object o : columnCommentNodes)
				{
					if (o instanceof Node)
					{
						Node n = (Node)o;
						EList<Element> children = n.getChildren();
						Node id2 = (Node)children.get(3);
						if (columnName.equals(id2.getLeaves().get(0).getValue()))
							return returnNode(n);
					}
				}	
			}
			
		}
		
		return null;
		
	}
	
}