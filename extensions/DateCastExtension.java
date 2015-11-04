import gts.modernization.extension.ExtensionValueReturn;
import gts.modernization.extension.MappingExtensionPoint;
import gts.modernization.model.CST.Node;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

/* 
 * A Grammar2Model extension for casting form String to Long.
 * 
 */
public class DateCastExtension extends MappingExtensionPoint {

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
				try {
					String dateString = n.getLeaves().get(1).getValue();
					return returnObject(new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH).parse(dateString));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		
		return null;
		
	}

}
