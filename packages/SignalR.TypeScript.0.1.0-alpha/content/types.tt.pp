﻿<#@ template language="C#" debug="true" hostspecific="true" #>
<#@ assembly name="$(SolutionDir)packages\SignalR.TypeScript.0.1.0-alpha\srts\srts.exe" #>
<#@ import namespace="SignalR.TypeScript" #>
<#@ assembly name="EnvDTE" #>
<#@ import namespace="EnvDTE" #>
<#@ assembly name="Microsoft.VisualStudio.Shell.Interop.10.0" #>
<#@ import namespace="Microsoft.VisualStudio.Shell.Interop" #>
<#@ assembly name="System.Core" #>
<#@ import namespace="System.Collections.Generic" #>
<#@ output extension=".d.ts" #>
<#
	var hostServiceProvider = (IServiceProvider)this.Host;
	var dte = (DTE)hostServiceProvider.GetService(typeof(DTE));

	Project p = null;	

	foreach (Project project in dte.Solution)
	{
		if(p == null) 
		{ 
			p = project; 		
			break; 		
		}
	}

	if (p!=null) 
	{
		var op = p.ConfigurationManager.ActiveConfiguration.Properties.Item("OutputPath").Value as string;
		if (op == null) { op = "!UNKNOWN!"; }				
		var path = @"$FullPath$" + op + "$OutputFileName$";				

		SignalRModule.Create(path);
		var output = "// AUTO GENERATED - DO NOT EDIT MANUALLY\n// Assembly File:" + path + "\n\n";
		
		output += SignalRModule.Declarations;
		output = output.Replace("\n", "\r\n");		
		
		Write(output);		
	}
	else 
	{
		Write("// Error: Can't find main project...");
	}
#>