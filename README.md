
  #### Split-copy-update :  It is a script file to continue kernel upgrade process especially "Copy rpm's to the filer" stage.
  
  
  #### Before you run the script you need:
  * ##### Mount filer into your DevVM. (to do this you can follow steps [here](https://confluence.eng.nutanix.com:8443/pages/viewpage.action?spaceKey=CALM&title=How+to+upload+files+to+nutanix+filer)

  * ##### Having nutanix-cvm-test repo and nutanix-cvm-3rdparty repo locally with same structure as filer repos.
  * ##### Add paths in input.sh according to your machine as follow:
    - ###### nutanix_cvm_3rdparty_filer_location : Path for nutanix_cvm_3rdparty filer repo at your machine.
    - ###### nutanix_cvm_test_filer_location : Path for nutanix_cvm_test filer repo at your machine.
    - ###### nutanix_cvm_3rdparty_local_location : Path for nutanix_cvm_3rdparty local repo at your machine.
    - ###### nutanix_cvm_test_local_location : Path for nutanix_cvm_test local repo at your machine.
  * ##### Copy both split-copy-update.sh and input.sh into build directory that was created from build proccess.
  
  
  #### Steps :
  1) ##### Split rpm's to kernel rpm's and OFED rpm's
  2) ##### Copy kernel rpm's to nutanix-cvm-test repo (filer repo and local repo). 
  3) ##### Remove repodata from both filer nutanix-cvm-test repo and local repo, then create new one.
  4) ##### Copy OFED rpm's to nutanix-cvm-3rdparty repo (filer repo and local repo).
  5) ##### Remove repodata from both filer nutanix-cvm-3rdparty repo and local repo, then create new one.


  ##### To Run the script :
        -  ./split-copy-update.sh
