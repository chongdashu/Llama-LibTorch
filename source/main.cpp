#pragma once
#include "llama_utils.h"


void main(int argc, const char* argv[]) {

    if (argc != 3) {
        std::cout << "Usage: " << argv[0] << " <source_path> <destination_path>" << std::endl;
        return;
    }

    std::string sourcePath = argv[1];
    std::string destPath = argv[2];

    auto weights = torch::pickle_load(GetTheBytes(sourcePath)).toGenericDict();
    auto arch = toOutputArchive(weights);
    arch.save_to(destPath);

}