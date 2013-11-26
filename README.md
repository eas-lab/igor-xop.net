# XOP.NET
###Sample .NET/CLR plugin for WaveMetrics' Igor Pro

This repo contains the source code for my [XOP.NET project](http://www.igorexchange.com/project/xop-net)
on [IgorExchange](http://www.igorexchange.com/)

It is a barebones Visual Studio 2012 solution for an 
[Igor Pro](http://www.wavemetrics.com/products/igorpro/igorpro.htm) XOP that calls C# (.NET) code in a separate library.

It was originally written to work on Igor 5, but I'm in the process of updating it for Igor 6.3.

To use it, you'll need to be familiar with both .NET and XOP programming,
and you'll need to write a little bit of C++/CLI, Microsoft's C++ -like language 
that lets you mix managed .NET code with traditional C++.

The basic idea is to compile the XOP as a C++/CLI project, and in places where the XOP
functions are executed, put in C++/CLI calls to the external C# code.  You can see an
example of this in the MyFunc function in MyXOP/MyXOP.cpp


###To build and test
 1. Make sure you've built the XOPSupport project in your XOP Toolkit folder
 2. Set an environment variable called XOPSupport to point to the XOPSupport directory
    and ensure that both Igor.lib and XOPSupport.lib are in that directory.
    The project files here use that variable to locate headers and libraries.
 3. Build this solution.  It will put MyCSharpLib.dll and MyXOP.xop in XOP.NET\output
 4. In your Igor Extensions folder, make a shortcut to MyXOP.xop.
 5. Start Igor
 6. Enter the following command
 
        Print MyFunc(6,7)

    You should see `42`.  That multiplication was courtesy of the .NET runtime.


The `DllResolver.cpp` file is there to help the .NET runtime library loader find
your custom .NET library, which gets loaded in step 6.  Without it, the 
[standard library search behavior](http://msdn.microsoft.com/en-us/library/ms682586.aspx)
doesn't work properly.


If you only have access to the 'Express' (free) versions of Visual Studio, the
XOP.NET.sln 'solution' file won't work for you.  Instead, open the 'project' files
`MyXOP.vcproj` and `MyCSharpLib.csproj` individually.  You may need to mess with some 
settings in the VC project so it can find the C# library dependency.


###License
Some parts of the source code are copies, or modified versions, of the example code
in the XOP Toolkit.  The modifications, and the new code here
are provided under the open source [BSD license](http://creativecommons.org/licenses/BSD/)
   
