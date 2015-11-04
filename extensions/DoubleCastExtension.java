import gts.modernization.extension.ExtensionValueReturn;
import gts.modernization.extension.MappingExtensionPoint;
import gts.modernization.model.CST.Node;

import java.util.List;

/* 
 * A Grammar2Model extension for casting form String to Long.
 * 
 */
public class DoubleCastExtension extends MappingExtensionPoint {

	@Override
	public ExtensionValueReturn execute() {
		
		List<?> nodes;
		Object param = getParam(0);
		if (param instanceof List<?>)
		{
			nodes = (List<?>) getParam(0);
			if (nodes.get(0) instanceof Node)
			{
				Node n = (Node) nodes.get(0);
				return returnObject(Double.valueOf(n.getLeaves().get(1).getValue()));
			}
		}
		
		return null;
		
	}

}
