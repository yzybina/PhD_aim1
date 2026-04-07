To install/build VG on my /home I downloaded the file from https://github.com/vgteam/vg?tab=readme-ov-file#download-releases

Then:
```
mkdir vg

#in a separate terminal on my Mac:
scp /Users/yuliazybina/Downloads/vg yzybina@mustard:/private/home/yzybina/vg

#back on HPC:
chmod +x vg
export PATH=$PATH:/private/home/yzybina/vg

```
