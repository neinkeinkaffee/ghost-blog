#!/bin/bash

fileid=$(gdrive list -q "name contains 'ghost_content'" | tail -1 | cut -f 1 -d " ")
gdrive sync upload --keep-local ghost-blog/ghost/content $fileid