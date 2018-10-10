#include <string>
#include <vector>

///Filesystem utils
namespace path_utils
{
	std::string filename(const std::string & path);

	std::string extension(const std::string & path);

	std::string replace_extension(const std::string & path, const std::string & exension);

	std::string parent_path(const std::string & path);

	std::string join(const std::string & path1, const std::string & path2);

	bool create_directories(const std::string & path);

    void deleteFile(const std::string & file);
}