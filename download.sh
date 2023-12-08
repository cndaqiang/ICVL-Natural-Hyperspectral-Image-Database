# 提取所有.mat、.raw、.hdr 文件的链接
links=$(grep -oP '(?<=href=")[^"]*(\.mat|\.raw|\.hdr|\.jpg)(?=")' source.html)
links=$(grep -oP '(?<=href=")[^"]*(\.mat|\.raw|\.hdr|\.jpg)(?=")' source2.html | tail -20)

# 下载文件
echo > filelist.txt
for link in $links; do
    # 获取文件名
    filename=$(basename $link)
    echo $filename >> filelist.txt
    # 如果文件不存在，则下载
    if [ ! -f $filename ]; then
        wget -nc $link
	sleep 10
    else
        echo "File $filename already exists. Skipping download."
    fi
done

wait

