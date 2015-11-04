package uk.ac.york.mhe504.dblm;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/**
 * This AntTask provides an interface to {@link uk.ac.york.mhe504.dblm.ModelRefiner}
 * 
 * @author mhe504@york.ac.uk
 *
 */
public class ModelRefinerAntTask extends Task {
		
	private String modelPath;

	public void execute() throws BuildException {
		
		new ModelRefiner().execute(modelPath);
	}
	

	public void setModelPath(String modelPath) {
		this.modelPath = modelPath;
	}
}
