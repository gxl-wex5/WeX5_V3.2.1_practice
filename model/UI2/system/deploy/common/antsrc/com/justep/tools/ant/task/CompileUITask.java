package com.justep.tools.ant.task;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

import com.justep.tools.ant.common.Utils;
import com.justep.ui.PackageWindowCompiler;

public class CompileUITask extends Task {

	private String justepHome;
	private String dirs;
	private String targetDir;
	private String webPath;
	private String indexURL;
	// mode 1: native 2: http server 3: uiserver 4: web
	private String mode;
	private String UI2 = "UI2";

	private String arrayToString(String[] array) {
		StringBuilder result = new StringBuilder();
		for (String item : array) {
			if (result.length() > 0) {
				result.append(",");
			}
			result.append("/" + UI2 + "/" + item);
		}

		return result.toString();
	}

	private String listToString(Set<String> list) {
		StringBuilder result = new StringBuilder();
		Iterator<String> iterator = list.iterator();
		while (iterator.hasNext()) {
			if (result.length() > 0) {
				result.append(",");
			}
			result.append(iterator.next());
		}

		return result.toString();
	}

	private String getFixedIndexURL(String indexURL) {
		return "/" + UI2 + indexURL;
	}

	private void fixFiles(String path) throws IOException {
		String indexUrl = null;
		File indexUrlFile = new File(path + "/indexUrl_in_server.txt");
		if (indexUrlFile.exists()) {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(indexUrlFile), "UTF-8"));
			indexUrl = br.readLine();
			br.close();
			if (indexUrl != null) {
				// 注意需要/，默认的是 ./，否则拼接出问题
				File mainWFile = new File(path + "/" + indexUrl);
				String mainPath = mainWFile.getParent();

				// intro
				String introHtmlFile = mainPath + "/intro.html";
				if (new File(introHtmlFile).exists()) {
					String srcStr = "<script intro=\\\"none\\\"></script>";
					String rpStr = "<script src=\"./intro.js\"></script>";
					Utils.replaceFileText(mainWFile.getAbsolutePath(), srcStr, rpStr);
				}
			}
		}
	}

	public void setJustepHome(String justepHome) {
		this.justepHome = justepHome;
	}

	public void setDirs(String dirs) {
		this.dirs = dirs;
	}

	public void setTargetDir(String targetDir) {
		this.targetDir = targetDir;
	}

	public void setIndexURL(String indexURL) {
		this.indexURL = indexURL;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public void execute() throws BuildException {
		if (dirs == null || "".equals(dirs)) {
			return;
		}

		try {
			String[] param = new String[] { justepHome + "/runtime/UIServer", arrayToString(dirs.split(",")), targetDir + webPath, "", "", getFixedIndexURL(indexURL),
					"3".equals(mode) ? "UIServer" : "none" };
			List<String> fails = new ArrayList<String>();
			Set<String> plugins = new HashSet<String>();
			PackageWindowCompiler.compile(param, fails, plugins);
			fixFiles(targetDir + webPath);
			getProject().setProperty("usedPlugins", listToString(plugins));
		} catch (Exception e) {
			throw new BuildException(e);
		}
	}

}