// dllmain.cpp : Defines the entry point for the DLL application.
/*

VISIT https://www.lua.org/pil/24.html for more detailed documentation

*/
#include "pch.h"
#include <windows.h>
#include <iostream>
#include <string>

#include <Mmsystem.h>
#include <mciapi.h>
#pragma comment(lib, "Winmm.lib")
using namespace std;
extern "C"
{
#include "Lua535/include/lua.h"
#include "Lua535/include/lauxlib.h"
#include "Lua535/include/lualib.h"

}



extern "C" static int lplay_wav(lua_State * L) {
    const char* wav_file = lua_tostring(L, 1);
    wchar_t* wString = new wchar_t[4096];
    MultiByteToWideChar(CP_ACP, 0, wav_file, -1, wString, 4096);
    //PlaySound(wString, GetModuleHandle(NULL), SND_FILENAME | SND_ASYNC);
    sndPlaySound(wString, SND_FILENAME | SND_ASYNC);
    delete[] wString;
    return 0;
}

extern "C" int __declspec(dllexport) __cdecl luaopen_playwavfile(lua_State * L) {


    lua_register(L, "play_wav", lplay_wav);  //register function to be global to lua script
    return 0;
}

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

