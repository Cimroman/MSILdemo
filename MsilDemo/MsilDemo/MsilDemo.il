//directive define allows to replace any text in a file by abreviation
#define MYTEXT "Any source code text to be replaced"

//Shortcuts for classes, methods, enums and fields
.typedef [mscorlib]System.Object as Object
.typedef class [mscorlib]System.STAThreadAttribute as STAThreadAttribute
.typedef valuetype [System.Windows.Forms]System.Windows.Forms.FormStartPosition as FormStartPosition
.typedef class [System.Windows.Forms]System.Windows.Forms.Application as Application
.typedef [System.Windows.Forms]System.Windows.Forms.Control as Control
.typedef class [System.Windows.Forms]System.Windows.Forms.Form as Form
.typedef [mscorlib]System.Console as Console
.typedef method void Console::WriteLine(string) as WriteLine

//MSCORLIB version
.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )        
  .ver 3:0:0:0
}

//Assembly info
.assembly MsilDemo
{
	.ver 1:0:0:0
	.hash algorithm 0x00008004
}

//Info about module
.module MsilDemo.exe
.imagebase           0x00400000
.file alignment      0x00000200
.stackreserve        0x00100000

//Processor kind    
.corflags            0x00000001

//0x2 means GUI (Winform) 0x3 console
.subsystem 0x2

//namespaces are just cosmetic in MSIL 
.namespace Fm
{
//And here comes the class...
.class private auto ansi abstract sealed beforefieldinit Fm.Program	extends Object
{
	//Main is the entrypoint method, but you can use any other marked by .entrypoint field
	.method private hidebysig static void Main () cil managed{
		.custom instance void STAThreadAttribute::.ctor() = (01 00 00 00)
		.maxstack 2
		.entrypoint
		//And here comes the MSIL pseudocode itself!
		//local variable of the Form type
		.locals init ([0] Form fm)
		//no operation...
		nop
		//A method calling...
		call void Application::EnableVisualStyles()
		nop
		//Preparing data (load) as parameter...
		ldc.i4.0
		//Calling method with parameter...
		call void Application::SetCompatibleTextRenderingDefault(bool)
		nop
		//Creating object by (constru).ctor
		newobj instance void Form::.ctor()
		//store data
		stloc.0
		//load data
		ldloc.0
		//load string
		ldstr "MSIL DEMO"
		//call method with string parameter...
		callvirt instance void Control::set_Text(string)
		nop
		ldloc.0
		//etc
		ldc.i4 128
		callvirt instance void Control::set_Height(int32)
		nop
		ldloc.0
		ldc.i4 640
		callvirt instance void Control::set_Width(int32)
		nop
		ldloc.0
		ldc.i4.1
		callvirt instance void Form::set_StartPosition(FormStartPosition)
		nop
		//And run the application with created form...
		ldloc.0
		call void Application::Run(Form)
		nop
		//return after form close
		ret
		//that's it!
		}
	}
}