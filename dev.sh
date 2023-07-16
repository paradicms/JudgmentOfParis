#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

THIS_DIR_PATH=$PWD
CACHE_DIR_PATH=$THIS_DIR_PATH/.paradicms/cache
DATA_DIR_PATH=$THIS_DIR_PATH/.paradicms/data
PROJECTS_DIR_PATH=$PWD/..

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/paradicms-spreadsheet-etl-action/action.py \
  --cache-directory-path $CACHE_DIR_PATH \
  --force-extract \
  --loaded-data-directory-path $DATA_DIR_PATH \
  --pipeline-id JudgmentOfParis \
  --spreadsheet "1WdwolQU728-DQSnNduXPyVAZloutGKFkUBKTXIqHZcU" \
  "$@"

poetry run $PROJECTS_DIR_PATH/paradicms-ssg-action/action.py \
  --cache-directory-path $CACHE_DIR_PATH \
  --data-path $DATA_DIR_PATH \
  --dev \
  --pipeline-id JudgmentOfParis
