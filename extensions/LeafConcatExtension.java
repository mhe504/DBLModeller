import gts.modernization.extension.ExtensionValueReturn;
import gts.modernization.extension.MappingExtensionPoint;
import gts.modernization.model.CST.Leaf;
import gts.modernization.model.CST.Node;

import java.util.List;

/* 
 * A Grammar2Model extension for casting form String to Long.
 * 
 */
public class LeafConcatExtension extends MappingExtensionPoint {

	@Override
	public ExtensionValueReturn execute() {
		
		List<?> nodes;
		Object param = getParam(0);
		if (param instanceof List<?>)
		{
			nodes = (List<?>) getParam(0);			
			if (nodes.get(0) instanceof Node)
			{
				Node primary = (Node)nodes.get(0);
				Node id1 = primary.getNodes().get(0);
				Node id2 = primary.getNodes().get(1);
				Node value = primary.getNodes().get(2);
				
				String name = id1.getLeaves().get(0).getValue() + 
							  "." + 
							  id2.getLeaves().get(0).getValue();
				
				List<Leaf> leaves = value.getLeaves();
				String comment = "";
				for (Leaf l : leaves)
				{
					if (!"'".equals(l.getValue()))
						comment = comment + l.getValue();
				}
				
				return returnString(";POSTPROCESS_MOVE:" + name + ",dataElement.itemUnit;" + comment);
			}
		}
		
		return null;
		
	}

}
