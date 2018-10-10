#include "path_utils.hpp"
#include <sstream>
#include <algorithm>
#include <sys/types.h>
#include <sys/stat.h>
#include <cstdio>

#ifdef _WIN32
#include <direct.h>
#include <windows.h>
#include <tchar.h>
#include <strsafe.h>
#else
#include <dirent.h>
#endif

namespace path_utils
{
    #ifdef _WIN32
	const char separator = '\\';
    #else
    const char separator = '/';
    #endif
	
	size_t getLastIndSep(const std::string & path)
	{
		char WindowSep = '\\';
		char UnixSep = '/';
		size_t pos1 = path.rfind(WindowSep);
		size_t pos2 = path.rfind(UnixSep);
		size_t ind = std::max<size_t>(pos1, pos2);
		if (ind == std::string::npos)
			ind = std::min<size_t>(pos1, pos2);
		return ind;
	}

	std::string filename(const std::string & path)
	{
		const size_t last_slash_idx = getLastIndSep(path);
		return std::string::npos != last_slash_idx? path.substr(last_slash_idx + 1): ""; 
	}

	std::string extension(const std::string & path)
	{
		const size_t last_slash_idx = path.rfind('.');
		return std::string::npos != last_slash_idx? path.substr(last_slash_idx + 1): ""; 
	}

	std::string replace_extension(const std::string & path, const std::string & exension)
	{
		const size_t last_slash_idx = path.rfind('.');
		return std::string::npos != last_slash_idx? path.substr(0, last_slash_idx + 1) + exension: path + exension; 
	}

	std::string parent_path(const std::string & path)
	{
		const size_t last_slash_idx = getLastIndSep(path);
        
		return path.substr(0, last_slash_idx - (path.back() == separator? 1: 0));
	}

	std::string join(const std::string & path1, const std::string & path2)
	{
		if (path1.empty() || path2.empty())
			return path1 + path2;

		if (path1.back() == separator || path2.front() == separator)
			return path1 +  path2;
		else
			return path1 + separator + path2;
 	}

	bool create_directories(const std::string & path)
	{
		int nError = 0;
#if defined(_WIN32)
		nError = _mkdir(path.c_str()); // can be used on Windows
#else 
		nError = mkdir(path.c_str(), 0700); // can be used on non-Windows
#endif
		return (nError != 0);
	}
    void deleteFile(const std::string & file)
    {
        std::remove(file.c_str());
    }
}
