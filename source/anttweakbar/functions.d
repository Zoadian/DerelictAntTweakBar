/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.anttweakbar.functions;

private
{
    import core.stdc.config;
    import derelict.anttweakbar.types;
}



extern(System)
{
	alias nothrow TwBar* function(const(char)* barName) da_TwNewBar;
	alias nothrow int function(TwBar* bar) da_TwDeleteBar;
	alias nothrow int function() da_TwDeleteAllBars;
	alias nothrow int function(const(TwBar)* bar) da_TwSetTopBar;
	alias nothrow TwBar* function() da_TwGetTopBar;
	alias nothrow int function(const(TwBar)* bar) da_TwSetBottomBar;
	alias nothrow TwBar* function() da_TwGetBottomBar;
	alias nothrow const(char)* function(const(TwBar)* bar) da_TwGetBarName;
	alias nothrow int function() da_TwGetBarCount;
	alias nothrow TwBar* function(int barIndex) da_TwGetBarByIndex;
	alias nothrow TwBar* function(const(char)* barName) da_TwGetBarByName;
	alias nothrow int function(TwBar* bar) da_TwRefreshBar;
	alias nothrow int function(TwBar* bar, const(char)* name, TwType type, void* var, const(char)* def) da_TwAddVarRW;
	alias nothrow int function(TwBar* bar, const(char)* name, TwType type, const(void)* var, const(char)* def) da_TwAddVarRO;
	alias nothrow int function(TwBar* bar, const(char)* name, TwType type, TwSetVarCallback setCallback, TwGetVarCallback getCallback, void* clientData, const(char)* def) da_TwAddVarCB;
	alias nothrow int function(TwBar* bar, const(char)* name, TwButtonCallback callback, void* clientData, const(char)* def) da_TwAddButton;
	alias nothrow int function(TwBar* bar, const(char)* name, const(char)* def) da_TwAddSeparator;
	alias nothrow int function(TwBar* bar, const(char)* name) da_TwRemoveVar;
	alias nothrow int function(TwBar* bar) da_TwRemoveAllVars;
	alias nothrow int function(const(char)* def) da_TwDefine;
	alias nothrow TwType function(const(char)* name, const(TwEnumVal)* enumValues, uint nbValues) da_TwDefineEnum;
	alias nothrow TwType function(const(char)* name, const(char)* enumString) da_TwDefineEnumFromString;
	alias nothrow TwType function(const(char)* name, const(TwStructMember)* structMembers, uint nbMembers, size_t structSize, TwSummaryCallback summaryCallback, void* summaryClientData) da_TwDefineStruct;
	alias nothrow void function(TwCopyCDStringToClient copyCDStringFunc) da_TwCopyCDStringToClientFunc;
	alias nothrow void function(char** destinationLibraryStringPtr, const(char)* sourceClientString) da_TwCopyCDStringToLibrary;
	alias nothrow int function(TwBar* bar, const(char)* varName, const(char)* paramName, TwParamValueType paramValueType, uint outValueMaxCount, void* outValues) da_TwGetParam;
	alias nothrow int function(TwBar* bar, const(char)* varName, const(char)* paramName, TwParamValueType paramValueType, uint inValueCount, const(void)* inValues) da_TwSetParam;
	alias nothrow int function(TwGraphAPI graphAPI, void* device) da_TwInit;
	alias nothrow int function() da_TwTerminate;
	alias nothrow int function() da_TwDraw;
	alias nothrow int function(int width, int height) da_TwWindowSize;
	alias nothrow int function(int windowID) da_TwSetCurrentWindow;
	alias nothrow int function() da_TwGetCurrentWindow;
	alias nothrow int function(int windowID) da_TwWindowExists;
	alias nothrow int function(int key, int modifiers) da_TwKeyPressed;
	alias nothrow int function(int key, int modifiers) da_TwKeyTest;
	alias nothrow int function(TwMouseAction action, TwMouseButtonID button) da_TwMouseButton;
	alias nothrow int function(int mouseX, int mouseY) da_TwMouseMotion;
	alias nothrow int function(int pos) da_TwMouseWheel;
	alias nothrow const(char)* function() da_TwGetLastError;
	alias nothrow void function(TwErrorHandler errorHandler) da_TwHandleErrors;
	alias nothrow int function(void* wnd, uint msg, uint wParam, int lParam) da_TwEventWin;
	alias nothrow int function(const(void)* sdlEvent, ubyte sdlMajorVersion, ubyte sdlMinorVersion) da_TwEventSDL;
	alias nothrow int function(int glfwButton, int glfwAction) da_TwEventMouseButtonGLFW;
	alias nothrow int function(int glfwKey, int glfwAction) da_TwEventKeyGLFW;
	alias nothrow int function(int glfwChar, int glfwAction) da_TwEventCharGLFW;
}

extern(C)
{
	alias nothrow int function(int glutButton, int glutState, int mouseX, int mouseY) da_TwEventMouseButtonGLUT;
	alias nothrow int function(int mouseX, int mouseY) da_TwEventMouseMotionGLUT;
	alias nothrow int function(ubyte glutKey, int mouseX, int mouseY) da_TwEventKeyboardGLUT;
	alias nothrow int function(int glutKey, int mouseX, int mouseY) da_TwEventSpecialGLUT;
//	alias nothrow int function(int function() glutGetModifiersFunc) da_TwGLUTModifiersFunc;
//	alias nothrow int function(const(void)* sfmlEvent, ubyte sfmlMajorVersion, ubyte sfmlMinorVersion) da_TwEventSFML;

	/**
		Note: The following expect GLFW2 bindings, not GLFW3.
		In particular GLFW2 keys do not match GLFW3 keys,
		you'll have to translate them if you want to use these functions.
	*/
	alias nothrow int function(int glfwButton, int glfwAction) da_TwEventMouseButtonGLFWcdecl;
	alias nothrow int function(int glfwKey, int glfwAction) da_TwEventKeyGLFWcdecl;
	alias nothrow int function(int glfwChar, int glfwAction) da_TwEventCharGLFWcdecl;
	alias nothrow int function(int mouseX, int mouseY) da_TwEventMousePosGLFWcdecl;
	alias nothrow int function(int wheelPos) da_TwEventMouseWheelGLFWcdecl;
}


__gshared
{
    da_TwNewBar TwNewBar;
	da_TwDeleteBar TwDeleteBar;
	da_TwDeleteAllBars TwDeleteAllBars;
	da_TwSetTopBar TwSetTopBar;
	da_TwGetTopBar TwGetTopBar;
	da_TwSetBottomBar TwSetBottomBar;
	da_TwGetBottomBar TwGetBottomBar;
	da_TwGetBarName TwGetBarName;
	da_TwGetBarCount TwGetBarCount;
	da_TwGetBarByIndex TwGetBarByIndex;
	da_TwGetBarByName TwGetBarByName;
	da_TwRefreshBar TwRefreshBar;
	da_TwAddVarRW TwAddVarRW;
	da_TwAddVarRO TwAddVarRO;
	da_TwAddVarCB TwAddVarCB;
	da_TwAddButton TwAddButton;
	da_TwAddSeparator TwAddSeparator;
	da_TwRemoveVar TwRemoveVar;
	da_TwRemoveAllVars TwRemoveAllVars;
	da_TwDefine TwDefine;
	da_TwDefineEnum TwDefineEnum;
	da_TwDefineEnumFromString TwDefineEnumFromString;
	da_TwDefineStruct TwDefineStruct;
	da_TwCopyCDStringToClientFunc TwCopyCDStringToClientFunc;
	da_TwCopyCDStringToLibrary TwCopyCDStringToLibrary;
	da_TwGetParam TwGetParam;
	da_TwSetParam TwSetParam;
	da_TwInit TwInit;
	da_TwTerminate TwTerminate;
	da_TwDraw TwDraw;
	da_TwWindowSize TwWindowSize;
	da_TwSetCurrentWindow TwSetCurrentWindow;
	da_TwGetCurrentWindow TwGetCurrentWindow;
	da_TwWindowExists TwWindowExists;
	da_TwKeyPressed TwKeyPressed;
	da_TwKeyTest TwKeyTest;
	da_TwMouseButton TwMouseButton;
	da_TwMouseMotion TwMouseMotion;
	da_TwMouseWheel TwMouseWheel;
	da_TwGetLastError TwGetLastError;
	da_TwHandleErrors TwHandleErrors;
	da_TwEventWin TwEventWin;
	da_TwEventSDL TwEventSDL;
	da_TwEventMouseButtonGLFW TwEventMouseButtonGLFW;
	da_TwEventKeyGLFW TwEventKeyGLFW;
	da_TwEventCharGLFW TwEventCharGLFW;
	
	da_TwEventMouseButtonGLUT TwEventMouseButtonGLUT;
	da_TwEventMouseMotionGLUT TwEventMouseMotionGLUT;
	da_TwEventKeyboardGLUT TwEventKeyboardGLUT;
	da_TwEventSpecialGLUT TwEventSpecialGLUT;
//	da_TwGLUTModifiersFunc TwGLUTModifiersFunc;
//	da_TwEventSFML TwEventSFML;
	
	da_TwEventMouseButtonGLFWcdecl TwEventMouseButtonGLFWcdecl;
	da_TwEventKeyGLFWcdecl TwEventKeyGLFWcdecl;
	da_TwEventCharGLFWcdecl TwEventCharGLFWcdecl;
	da_TwEventMousePosGLFWcdecl TwEventMousePosGLFWcdecl;
}
