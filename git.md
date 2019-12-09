# Git 기초

Git은 분산형 버전관리 시스템 (DVCS)소스코드의 이력을 확인하고, 협업단계에서 활용가능하다.

## 0. 기본설정

 윈도우에서 git을 활용하기 위해서는  `git bash`가 필요!.

[설치링크](https://gitforwindows.org/)

설치 이후에 `commit`을 작성하는 `author` 설정이 필요하다. 

```bash
$ git config --global user.name { github username }
$ git config --global user.email { github useremail }
```

설정 내용을 입력하고 확인

## 1. git 저장소 설정

특정 프로젝트 폴더에서 git 을 활용하기 위해서는 아래의 명령어를 입력한다.

```bash
# 폴더 생성후 폴더 내부 우 클릭 -> git bash 실행
$ git init # 명령어 입력
Initialized empty Git repository in C:/Users/student/Desktop/git/.git/

student@M16044 MINGW64 ~/Desktop/git (master)
```

* 해당 디렉토리 내에 .git 이라는 숨김폴더가 생성되며, 모든 git과 관련된 동작은 해당폴더에 기록
* git bash 에서 (master) 라는 브랜치 정보가 표기됨

## 2. add

git 에서 커밋할 대상 파일을 staging area로 이동시키는 명령어

```bash
$ git add a.txt # 특정파일을 stage
$ git add images/ # 특정폴더를 stage
$ git add . # 모든 디렉토리 파일을 stage
```

* add전 상태

  ```bash
  $ git status
  On branch master
  
  No commits yet
  
  Untracked files: # git 이력에 담기지 않은 파일생성
    (use "git add <file>..." to include in what will be committed)
    # git add 명령어를 통해서 커밋 될 곳에 추가해라
          a.txt
          b.txt
  
  nothing added to commit but untracked files present (use "git add" to track)
  ##########################################################################
  student@M16044 MINGW64 ~/Desktop/git (master)
  $ git add a.txt # add
  ```

  

* add후 상태

  ```bash
  # a.txt 만 add해서 staging area에 올려놓은 상태
  student@M16044 MINGW64 ~/Desktop/git (master)
  $ git status
  On branch master
  
  No commits yet
  
  Changes to be committed: # 커밋 될 변경사항
    (use "git rm --cached <file>..." to unstage)
          new file:   a.txt
  
  Untracked files:
    (use "git add <file>..." to include in what will be committed)
          b.txt
  ```

  **항상 `git status` 명령어를 통해 현재 상태를 확인하는 것이 중요하다!!**

## 3. commit

git 에서 이력을 남기기 위해서는 commit을 통해 진행

`commit`을 남길 때에는 항상 메세지를 작성한다. 메세지는  해당이력에 대한 정보를 담는다.

```bash
# $ git commit -m '커밋 메세지'
student@M16044 MINGW64 ~/Desktop/git (master)
$ git commit -m '파일 add'
[master (root-commit) a2b4a23] 파일 add
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a.txt
 create mode 100644 b.txt
```

커밋 이력을 확인하기 위한 명령어 $git log

```bash
student@M16044 MINGW64 ~/Desktop/git (master)
$ git log
commit a2b4a2346ddad6f07d35b1f31b89d96ad7aeed4e (HEAD -> master)
Author: won-spec <jswon1110@gmail.com>
Date:   Mon Dec 9 14:25:23 2019 +0900

    파일 add
```

이후 변경사항이 발생하게 된다면, add -> commit을 진행

add : 커밋할 대상 파일을 선정(기록 대상 선정)

commit : 이력의 확정(기록)

# 원격 저장소 활용하기(remote repository)

원격 저장소를 제공해주는 서비스를 다양하다. 우리는 github를 사용

## 0. 기본설정

github에 비어있는 저장소 (repository) 생성

## 1. 원격 저장소 설정

원격 저장소(remote)를 `origin`이라는 이름으로 http://~ 에 설정

```bash
$ git remote add origin http://~
########################################################################
student@M16044 MINGW64 ~/Desktop/git (master)
$ git remote add origin https://github.com/won-spec/test.git
```

아래의 명령어를 통해서 저장된 원격저장소 목록을 확인 할 수 있다.

```bash
student@M16044 MINGW64 ~/Desktop/git (master)
$ git remote -v
origin  https://github.com/won-spec/test.git (fetch)
origin  https://github.com/won-spec/test.git (push)
```

잘못 설정된 경우 삭제하는 명령어

```bash
$ git remote rm origin # origin이라는 원격저장소 삭제
$ git remote -v # 저장소 목록확인
```

## 2. push

```bash
$ git push origin master

Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 8 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 220 bytes | 220.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/won-spec/test.git
 * [new branch]      master -> master
```

이후에 변경된 사항이 발생하였을 때,  $ git push origin master  명령어를 통해 매번 업로드 가능
