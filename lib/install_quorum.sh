#!/bin/bash

source qm.variables
source lib/common.sh

echo $CYAN"Building Quorum, "$quorum_version"..."$COLOR_END

rm -rf quorum

# for git
# docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/jpmorganchase/quorum.git
# docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git -w /git/quorum alpine/git checkout $quorum_version

#### local
rm -rf quorum
cp -r ../quorum quorum
pushd quorum > /dev/null

echo $CYAN"Building quorum locally ..."$COLOR_END
popd > /dev/null

### local

docker run -it --rm -v $(pwd)/quorum:/quorum -w /quorum golang:1.15 make all

## Change the owneship of quorum directory
chownDir 'quorum'

echo $CYAN"Building Quorum, "$quorum_version" Completed."$COLOR_END
