# ubuntu-mecab

## Description
This repository is dockerfile for mecab/cabocha on ubuntu.

## Requirements
You need to some following archives.

|Software|
|:---------:|
| cabocha-0.69.tar.bz2 |
| CRF++-0.58.tar.gz |

mecab will use what is provided in the package.

## Build
Now, you can build docker image using following command.

```
docker build -t IMAGENAME:TAG .
```

Onece done, you can use mecab or cabocha from host os terminal.  
e.g)  
```
echo "私はテスト用のメッセージを入力した" | docker run --rm -i IMAGENAME cabocha -f2
# or
echo "これはテスト用のメッセージです" | docker run --rm -i IMAGENAME mecab
````
