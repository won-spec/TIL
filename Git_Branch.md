# Git Branch

Git 개발 흐름에서 branch는 매우 중요하다. 독립적인 개발환경을 제공하여, 동시에 다양한 작업을 진행 할 수  있도록 만들어준다. 

일반적으로 브랜치의 이름은 해당작업을 나타낸다.

1. 기초명령어

   ```bash
   $ git branch # branch 목록확인
   $ git branch {브랜치이름} # {브랜치이름}생성
   $ git checkout {브랜치이름} # {브랜치이름}으로 이동
   $ git branch -d {브랜치이름} # {브랜치이름}삭제
   $ git checkout -b {브랜치이름} # {브랜치이름} 생성 및 이동
   ```

2. branch 병합

```bash
(master) $ git merge feature
# master 브랜치로 feature 브랜치 이력 가져오기(병합)
```



```bash

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git branch
* master

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git branch testbranch

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git branch
* master
  testbranch

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git checkout testbranch
Switched to branch 'testbranch'

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ git branch
  master
* testbranch

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ touch test.html

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ git add .

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ git commit -m 'Testbranch -tset'
[testbranch 413022f] Testbranch -tset
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 test.html

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ git log --oneline
413022f (HEAD -> testbranch) Testbranch -tset
9c2e34a (origin/master, master) 멀캠- 업로드2
40b3f81 집 -업로드1
11b451b 멀캠- 업로드 index

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git checkout testbranch
Switched to branch 'testbranch'

student@M16044 MINGW64 ~/Desktop/멀캠/web (testbranch)
$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git log --oneline
9c2e34a (HEAD -> master, origin/master) 멀캠- 업로드2
40b3f81 집 -업로드1
11b451b 멀캠- 업로드 index

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git merge testbranch
Updating 9c2e34a..413022f
Fast-forward
 test.html | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 test.html

student@M16044 MINGW64 ~/Desktop/멀캠/web (master)
$ git log --oneline
413022f (HEAD -> master, testbranch) Testbranch -tset
9c2e34a (origin/master) 멀캠- 업로드2
40b3f81 집 -업로드1
11b451b 멀캠- 업로드 index



```

