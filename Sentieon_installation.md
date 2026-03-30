Log in to my /home directory on prism

```
mkdir sentieon

cd sentieon

wget -link provided by Don to download the software
```
Use a different link supplied by Sentieon to accept license agreement. A .lic file will automatically download.
In a separate shell window upload the .lic file:
```
scp /Users/yuliazybina/Downloads/UCSC_Paten_lab_eval.lic yzybina@mustard:/private/home/yzybina
```
Then:

```
#Set environment variable with license path:
export SENTIEON_LICENSE=/private/home/yzybina/sentieon/UCSC_Paten_lab_eval.lic

#unpack the binary:
tar xvzf sentieon-genomics-202503.02.tar.gz

#For convenience, set the binary path as shown below, where PATH_TO_ SENTIEON_BINARY_DIRECTORY is where Sentieon binary is installed.
export SENTIEON_INSTALL_DIR=/private/home/yzybina/sentieon/sentieon-genomics-202503.02

#For improved performance when using NFS storage, set the SENTIEON_TMPDIR environmental variable to point to local scratch fast storage.
export SENTIEON_TMPDIR=/tmp
```


Quickstart at first to test:
```
wget https://s3.amazonaws.com/sentieon-release/other/sentieon_quickstart.tar.gz
tar xzvf sentieon_quickstart.tar.gz

```
Here is what is included in the package:
  * sentieon_quickstart.sh: the sample shell script that drives the entire pipeline.
  * reference: a directory that contains human genome reference files and database files of known SNP sites.
  * models: a directory that contains DNAscope model files.
  * FASTQ files: sample sequence files.
