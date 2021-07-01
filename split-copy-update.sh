#!/bin/bash

source input.sh

echo "############################################################################################"
echo "#                                     STEP ONE                                             #"
echo "############################################################################################"

echo "* Move kernel rpms under kernel directory."
echo "** keep ofed rpms under gathered_rpms."

set -e
set -x

sudo rm -rf kernel_rpms
sudo mkdir kernel_rpms

cd gathered_rpms
sudo chmod * 777
ls -al

sudo mv kernel-*.cvm.x86_64.rpm ../kernel_rpms/
sudo rm -rf kernel-*.src.rpm

sudo mv bpftool-* ../kernel_rpms/
sudo mv *perf-* ../kernel_rpms/

echo "############################################################################################"
echo "#                                     STEP TWO                                             #"
echo "############################################################################################"
echo "Copy MLNX_OFED rpms to nutanix-cvm-3rdparty filer repo"
cp gathered_rpms/* $nutanix_cvm_3rdparty_filer_location/7.7/x86_64/Packages/

echo "Copy MLNX_OFED rpms to nutanix-cvm-3rdparty local repo"
cp gathered_rpms/* $nutanix_cvm_3rdparty_local_location/7.7/x86_64/Packages/


echo "############################################################################################"
echo "#                                     STEP THREE                                           #"
echo "############################################################################################"
echo "Create new repodata for Nutanix CVM 3rdParty repo"
rm -rf $nutanix_cvm_3rdparty_filer_location/7.7/x86_64/repodata
rm -rf $nutanix_cvm_3rdparty_local_location/7.7/x86_64/repodata
createrepo $nutanix_cvm_3rdparty_local_location/7.7/x86_64/
cp -r $nutanix_cvm_3rdparty_local_location/7.7/x86_64/repodata $nutanix_cvm_3rdparty_filer_location/7.7/x86_64/



echo "############################################################################################"
echo "#                                     STEP four                                            #"
echo "############################################################################################"
echo "Copy Kernel rpms to nutanix-cvm-tes filer repo"
cp kernel_rpms/* $nutanix_cvm_test_filer_location/7/x86_64/Packages/

echo "Copy Kernel rpms to nutanix-cvm-tes local repo"
cp kernel_rpms/* $nutanix_cvm_test_local_location/7/x86_64/Packages/

echo "############################################################################################"
echo "#                                     STEP five                                            #"
echo "############################################################################################"
echo "Create new repodata for Nutanix CVM Test repo"
rm -rf $nutanix_cvm_test_filer_location/7/x86_64/repodata
rm -rf $nutanix_cvm_test_local_location/7/x86_64/repodata
createrepo $nutanix_cvm_test_local_location/7/x86_64/
cp -r $nutanix_cvm_test_local_location/7/x86_64/repodata $nutanix_cvm_test_filer_location/7/x86_64/
