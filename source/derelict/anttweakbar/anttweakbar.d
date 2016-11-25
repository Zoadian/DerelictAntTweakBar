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
module derelict.anttweakbar.anttweakbar;

public
{
    import derelict.anttweakbar.types;
    import derelict.anttweakbar.functions;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
		version(Win64) enum libNames = "AntTweakBar64.dll";
		else enum libNames = "AntTweakBar.dll";
    else static if(Derelict_OS_Mac)
        enum libNames = "libAntTweakBar.dylib";
    else static if(Derelict_OS_Posix)
        enum libNames = "libAntTweakBar.so,libAntTweakBar.so,/usr/local/lib/libAntTweakBar.so,/usr/local/lib/libAntTweakBar.so";
    else
        static assert(0, "Need to implement AntTweakBar libNames for this operating system.");
}

class DerelictAntTweakBarLoader : SharedLibLoader
{
    protected
    {
        override void loadSymbols()
        {
			bindFunc(cast(void**)&TwNewBar                   , "_TwNewBar@4");
			bindFunc(cast(void**)&TwDeleteBar                , "_TwDeleteBar@4");
			bindFunc(cast(void**)&TwDeleteAllBars            , "_TwDeleteAllBars@0");
			bindFunc(cast(void**)&TwSetTopBar                , "_TwSetTopBar@4");
			bindFunc(cast(void**)&TwGetTopBar                , "_TwGetTopBar@0");
			bindFunc(cast(void**)&TwSetBottomBar             , "_TwSetBottomBar@4");
			bindFunc(cast(void**)&TwGetBottomBar             , "_TwGetBottomBar@0");
			bindFunc(cast(void**)&TwGetBarName               , "_TwGetBarName@4");
			bindFunc(cast(void**)&TwGetBarCount              , "_TwGetBarCount@0");
			bindFunc(cast(void**)&TwGetBarByIndex            , "_TwGetBarByIndex@4");
			bindFunc(cast(void**)&TwGetBarByName             , "_TwGetBarByName@4");
			bindFunc(cast(void**)&TwRefreshBar               , "_TwRefreshBar@4");
			bindFunc(cast(void**)&TwAddVarRW                 , "_TwAddVarRW@20");
			bindFunc(cast(void**)&TwAddVarRO                 , "_TwAddVarRO@20");
			bindFunc(cast(void**)&TwAddVarCB                 , "_TwAddVarCB@28");
			bindFunc(cast(void**)&TwAddButton                , "_TwAddButton@20");
			bindFunc(cast(void**)&TwAddSeparator             , "_TwAddSeparator@12");
			bindFunc(cast(void**)&TwRemoveVar                , "_TwRemoveVar@8");
			bindFunc(cast(void**)&TwRemoveAllVars            , "_TwRemoveAllVars@4");
			bindFunc(cast(void**)&TwDefine                   , "_TwDefine@4");
			bindFunc(cast(void**)&TwDefineEnum               , "_TwDefineEnum@12");
			bindFunc(cast(void**)&TwDefineEnumFromString     , "_TwDefineEnumFromString@8");
			bindFunc(cast(void**)&TwDefineStruct             , "_TwDefineStruct@24");
			bindFunc(cast(void**)&TwCopyCDStringToClientFunc , "_TwCopyCDStringToClientFunc@4");
			bindFunc(cast(void**)&TwCopyCDStringToLibrary    , "_TwCopyCDStringToLibrary@8");
			bindFunc(cast(void**)&TwGetParam                 , "_TwGetParam@24");
			bindFunc(cast(void**)&TwSetParam                 , "_TwSetParam@24");
			bindFunc(cast(void**)&TwInit                     , "_TwInit@8");
			bindFunc(cast(void**)&TwTerminate                , "_TwTerminate@0");
			bindFunc(cast(void**)&TwDraw                     , "_TwDraw@0");
			bindFunc(cast(void**)&TwWindowSize               , "_TwWindowSize@8");
			bindFunc(cast(void**)&TwSetCurrentWindow         , "_TwSetCurrentWindow@4");
			bindFunc(cast(void**)&TwGetCurrentWindow         , "_TwGetCurrentWindow@0");
			bindFunc(cast(void**)&TwWindowExists             , "_TwWindowExists@4");
			bindFunc(cast(void**)&TwKeyPressed               , "_TwKeyPressed@8");
			bindFunc(cast(void**)&TwKeyTest                  , "_TwKeyTest@8");
			bindFunc(cast(void**)&TwMouseButton              , "_TwMouseButton@8");
			bindFunc(cast(void**)&TwMouseMotion              , "_TwMouseMotion@8");
			bindFunc(cast(void**)&TwMouseWheel               , "_TwMouseWheel@4");
			bindFunc(cast(void**)&TwGetLastError             , "_TwGetLastError@0");
			bindFunc(cast(void**)&TwHandleErrors             , "_TwHandleErrors@4");
			bindFunc(cast(void**)&TwEventWin                 , "_TwEventWin@16");
			bindFunc(cast(void**)&TwEventSDL                 , "_TwEventSDL@12");
			bindFunc(cast(void**)&TwEventMouseButtonGLFW     , "_TwEventMouseButtonGLFW@8");
			bindFunc(cast(void**)&TwEventKeyGLFW             , "_TwEventKeyGLFW@8");
			bindFunc(cast(void**)&TwEventCharGLFW            , "_TwEventCharGLFW@8");
			
			bindFunc(cast(void**)&TwEventMouseButtonGLUT , "TwEventMouseButtonGLUT");
			bindFunc(cast(void**)&TwEventMouseMotionGLUT , "TwEventMouseMotionGLUT");
			bindFunc(cast(void**)&TwEventKeyboardGLUT    , "TwEventKeyboardGLUT");
			bindFunc(cast(void**)&TwEventSpecialGLUT     , "TwEventSpecialGLUT");
//			bindFunc(cast(void**)&TwGLUTModifiersFunc    , "TwGLUTModifiersFunc");
//			bindFunc(cast(void**)&TwEventSFML            , "TwEventSFML");
			
			bindFunc(cast(void**)&TwEventMouseButtonGLFWcdecl , "TwEventMouseButtonGLFWcdecl");
			bindFunc(cast(void**)&TwEventKeyGLFWcdecl         , "TwEventKeyGLFWcdecl");
			bindFunc(cast(void**)&TwEventCharGLFWcdecl        , "TwEventCharGLFWcdecl");
			bindFunc(cast(void**)&TwEventMousePosGLFWcdecl    , "TwEventMousePosGLFWcdecl");
        }
    }
    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictAntTweakBarLoader DerelictAntTweakBar;

shared static this()
{
    DerelictAntTweakBar = new DerelictAntTweakBarLoader();
}

shared static ~this()
{
    DerelictAntTweakBar.unload();
}
