# Git Branch

Git 개발 흐름에서 branch는 매우 중요하다. 독립적인 개발환경을 제공하여, 동시에 다양한 작업을 진행 할 수  있도록 만들어준다. 

일반적으로 브랜치의 이름은 해당작업을 나타낸다.

브랜치를 뻗은 이후에 작업을 해야함!!!

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

3. 실행 코드 예시

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



### 상황 1. fast-foward

1. feature/test branch 생성 및 이동

   ```bash
   $ git checkout -b feature/test
   Switched to a new branch 'feature/test'
   ```

   

2. 작업 완료 후 commit

   ```bash
   $ touch test.txt
   $ git add .
   $ git commit -m 'test 기능개발완료'
   
   $ git log --oneline
   82bfa1c (HEAD -> feature/test) test기능개발 완료
   413022f (testbranch, master) Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   ```


3. master 이동

   ```bash
   $ git checkout master
   
   $ git log --oneline
   413022f (HEAD -> master, testbranch) Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   ```


4. master에 병합

   ```bash
   $ git merge feature/test
   
   Updating 413022f..82bfa1c
   Fast-forward 
    test.txt | 0
    1 file changed, 0 insertions(+), 0 deletions(-)
    create mode 100644 test.txt
   
   ```


5. 결과 -> fast-foward (단순히 HEAD를 이동)

   ```bash
   $ git log --oneline
   82bfa1c (HEAD -> master, feature/test) test기능개발 완료
   413022f (testbranch) Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   ```

6. branch 삭제

   ```bash
   $ git branch -d feature/test
   Deleted branch feature/test (was 82bfa1c).
   ```
   
   

---

### 상황 2. merge commit

feature 브랜치에서 작업하고 있는동안 master브랜치에서 이력이 추가적으로

발생한 경우

1. feature/signout branch 생성 및 이동

   ```bash
   $ git checkout -b feature/signout
   Switched to a new branch 'feature/signout'
   ```

   

2. 작업 완료 후 commit

   ```bash
   $ git add .
   $ git commit -m "Complete"
   
   $ git log --oneline
   7431ede (HEAD -> feature/signout) Complete
   82bfa1c (master) test기능개발 완료
   413022f Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   ```

   

3. master 이동

   ```bash
   $ git checkout master
   Switched to branch 'master'
   ```

   

4. *master에 추가 commit 이 발생시키기!!*

   * **다른 파일을 수정 혹은 생성하세요!**

   ```bash
   $ touch master
   $ git add .
   $ git commit -m ' Update master '
   ```

   ```bash
   $ git log --oneline
   515dc71 (HEAD -> master)  Update master
   82bfa1c test기능개발 완료
   413022f Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   
   # branch 'feature/signout' 의 log
   $ git checkout feature/signout
   Switched to branch 'feature/signout'
   
   $ git log --oneline
   7431ede (HEAD -> feature/signout) Complete
   82bfa1c test기능개발 완료
   413022f Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   
   ```

   

5. master에 병합

   ```bash
   $ git merge feature/signout
   ```

   

6. 결과 -> 자동으로 *merge commit 발생*

   ```bash
   $ git log --oneline
   43f3c38 (HEAD -> master) Merge branch 'feature/signout'
   515dc71  Update master
   7431ede (feature/signout) Complete
   82bfa1c test기능개발 완료
   413022f Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   
   ```

   

7. 그래프 확인하기

   ```bash
   $ git log --oneline --graph
   *   43f3c38 (HEAD -> master) Merge branch 'feature/signout'
   |\
   | * 7431ede (feature/signout) Complete
   * | 515dc71  Update master
   |/
   * 82bfa1c test기능개발 완료
   * 413022f Testbranch -tset
   * 9c2e34a (origin/master) 멀캠- 업로드2
   * 40b3f81 집 -업로드1
   * 11b451b 멀캠- 업로드 index
   
   ```

   

8. branch 삭제

   

---

### 상황 3. merge commit 충돌

1. hotfix/test branch 생성 및 이동

   ```bash
   $ git checkout -b hotfix/test
   ```

   

2. 작업 완료 후 commit

   ```bash
   # 직접 test.txt파일 수정
   $ git add .
   $ git commit -m 'hotfix test'
   $ git log --oneline
   ba83689 (HEAD -> hotfix/test) hotfix test
   43f3c38 (master) Merge branch 'feature/signout'
   515dc71  Update master
   7431ede (feature/signout) Complete
   82bfa1c test기능개발 완료
   413022f Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   ```
   
   


3. master 이동

   ```bash
   $ git checkout master
   ```
   
   


4. *master에 추가 commit 이 발생시키기!!*

   * **동일 파일을 수정 혹은 생성하세요!**

   ```bash
   # test.txt 수정
   $ git add .
   $ git commit -m 'master test'
   ```

   

5. master에 병합

   ```bash
   # conflict 발생
   $ git merge hotfix/test
   Auto-merging test.txt
   CONFLICT (content): Merge conflict in test.txt
   Automatic merge failed; fix conflicts and then commit the result.
   
   ```
   
   


6. 결과 -> *merge conflict발생*

   


7. 충돌 확인 및 해결

   ```bash
   $ git status
   On branch master
   Your branch is ahead of 'origin/master' by 6 commits.
     (use "git push" to publish your local commits)
   
   You have unmerged paths.
     (fix conflicts and run "git commit")
     (use "git merge --abort" to abort the merge)
   
   Unmerged paths:
     (use "git add <file>..." to mark resolution)
           both modified:   test.txt
   
   no changes added to commit (use "git add" and/or "git commit -a")
   
   # 충돌 코딩 코드 선택!
   ```
   
   


8. merge commit 진행

    ```bash
    $ git add .
    $ git commit # 이전에 설정해주었기 때문에 따로 메세지 작성 불필요
```
   
   * vim 편집기 화면이 나타납니다.
   * 자동으로 작성된 커밋 메시지를 확인하고, `esc`를 누른 후 `:wq`를 입력하여 저장 및 종료를 합니다.
      * `w` : write
      * `q` : quit
   * 커밋이  확인 해봅시다.
   
   ```bash
   $ git log --oneline
   a53a103 (HEAD -> master) Merge branch 'hotfix/test'
   90b2a7f master test
   ba83689 (hotfix/test) hotfix test
   43f3c38 Merge branch 'feature/signout'
   515dc71  Update master
   7431ede (feature/signout) Complete
   82bfa1c test기능개발 완료
   413022f Testbranch -tset
   9c2e34a (origin/master) 멀캠- 업로드2
   40b3f81 집 -업로드1
   11b451b 멀캠- 업로드 index
   ```
   
   
   
9. 그래프 확인하기

    ```bash
   $ git log --oneline --graph
   *   a53a103 (HEAD -> master) Merge branch 'hotfix/test'
   |\
   | * ba83689 (hotfix/test) hotfix test
   * | 90b2a7f master test
   |/
   *   43f3c38 Merge branch 'feature/signout'
   |\
   | * 7431ede (feature/signout) Complete
   * | 515dc71  Update master
   |/
   * 82bfa1c test기능개발 완료
   * 413022f Testbranch -tset
   * 9c2e34a (origin/master) 멀캠- 업로드2
   * 40b3f81 집 -업로드1
   * 11b451b 멀캠- 업로드 index
    ```


10. branch 삭제

