#!/bin/sh

CHANGELOG_FILE=test.log

# update CHANGELOG ----------------
    echo "" > $CHANGELOG_FILE
    echo "# CHANGELOG" >> $CHANGELOG_FILE

    git tag -l --sort=-committerdate| while read TAG ; do
        echo >> $CHANGELOG_FILE
        if [ $NEXT ] ; then
            echo "## "$NEXT >> $CHANGELOG_FILE
    #    else
    #        echo "## Current" >> $CHANGELOG_FILE
        fi
        GIT_PAGER=cat git log --no-merges --format=" * %s" $TAG..$NEXT >> $CHANGELOG_FILE
        NEXT=$TAG
    done
#    FIRST=$(git tag -l --sort=-committerdate| head -1)
#    FIRST=$(git tag -l --sort=-committerdate)
    echo >> $CHANGELOG_FILE
#    echo "## $FIRST" >> $CHANGELOG_FILE
#    GIT_PAGER=cat git log --no-merges --format=" * %s" $FIRST >> $CHANGELOG_FILE
    # /update CHANGELOG ----------------

