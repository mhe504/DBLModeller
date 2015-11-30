import java.util.List;

import org.eclipse.emf.common.util.EList;

import gts.modernization.extension.ExtensionValueReturn;
import gts.modernization.extension.MappingExtensionPoint;
import gts.modernization.model.CST.Element;
import gts.modernization.model.CST.Leaf;
import gts.modernization.model.CST.Node;

/*
 * This extension takes a single node as input and returns
 * a string containing the values of it's children.
 * 
 */

public class NodeToString extends MappingExtensionPoint {

	@Override
	public ExtensionValueReturn execute() {
		
		Object param0 =  getParam(0);
		
		if (param0 instanceof List<?>)
		{
			List<?> nodes = (List<?>) getParam(0);
			if (nodes.get(0) instanceof Node)
			{
				Node column = (Node) nodes.get(0);
				String result = "";

				if (getParams().size() ==2 )
				{
					result = column.getLeaves().get(2).getValue();
					List<?> nodes2 = (List<?>) getParam(1);
					Node name = (Node) nodes2.get(0);
					result = result.replace("'", "") + ";DBLM_MOVE:" + name.getLeaves().get(0).getValue() + ",dataElement, data:RelationalTable;";						

				}
				else
				{
					EList<Element> children =column.getChildren();
					Node n3 = (Node)children.get(3);
					Leaf tbl = n3.getLeaves().get(0);
					if (tbl.getKind().equals("Q3"))
						tbl = n3.getLeaves().get(1);
					Node n4 = (Node)children.get(1);
					Leaf col = n4.getLeaves().get(0);
					if (col.getKind().equals("Q3"))
						col = n4.getLeaves().get(1);
					
					Leaf l = (Leaf)children.get(5);
					result = l.getValue().replace("'", "") + ";DBLM_MOVE:" + col.getValue() + "." + 
							tbl.getValue() +",itemUnit;";
				}
				
				return returnString(result);
			}
		}
		
		return null;
		
	}
}
