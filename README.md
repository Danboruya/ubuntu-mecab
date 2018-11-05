# ubuntu-mecab

## Description
This repository is dockerfile for mecab/cabocha.  
This container's base-image is Ubuntu16.04.

## Requirements
You need to some following archives.

|Software|
|:---------:|
| [cabocha-0.69.tar.bz2](https://drive.google.com/a/aiit.ac.jp/folderview?id=0B4y35FiV1wh7cGRCUUJHVTNJRnM&usp=sharing#list) |
| [CRF++-0.58.tar.gz](https://drive.google.com/folderview?id=0B4y35FiV1wh7fngteFhHQUN2Y1B5eUJBNHZUemJYQV9VWlBUb3JlX0xBdWVZTWtSbVBneU0&usp=drive_web) |

**These files must be in the same directory as the directory where Dockerfile is located.**  
mecab will use what is provided in the package.

## Build
Now, you can build docker image using following command.

```
docker build -t IMAGENAME:TAG .
```

## Run

Once done, you can use mecab or cabocha from host os terminal.  
e.g)  
```
echo "私はテスト用のメッセージを入力した" | docker run --rm -i IMAGENAME:TAG cabocha -f2
# or
echo "これはテスト用のメッセージです" | docker run --rm -i IMAGENAME:TAG mecab
```

**NOTICE: Docker on linux need root permission for running docker command.**
