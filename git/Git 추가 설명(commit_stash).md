## Git 추가 설명 

### 1. commit

> commit을 통해 이력을 확정하면 hash 값 이 부여되며, 이 값을 통해 동일한 커밋인지를 확인한다. (hash의 가짓수는 무궁무진하게 많기 때문에 겹칠 확률이 거의 없다.)

> → log 명령어를 통해서 commit의 hash값을 확인 할 수 있다. (노란색 글씨)

> → q 버튼을 눌러서 나간다. 

```bash
# 작업 내용 X, Working Directory, Staging area변화도 없을 때 
# 즉 디렉토리의 변경사항이 아무것도 없을 때 
$ git commit 
nothing to commit, working tree clean 

# wd변화 o, staging area는 비어있을 때 
untracked files:
		lee.txt
nothing added to commit but
untracked files present 


```

### ※ commit message 작성하기 

> 부제 : vim 활용법 

```bash
$ git commit 

```

> 상기 명령어처럼 메시지 없이 저장했다면 메시지 창이 뜰 것

 

* 편집모드(i)
  * 문서 편집 가능			
* 명령모드(esc) 
  *  dd : 해당 줄 삭제 
  *  :wq : 저장 및 종료 
    * w : write(저장)
    * q : quit(종료)
  * :q! : 강제종료 (필수! 동시에 누를 필요는 없다)
    * q : quit
    * ! : 강제 

### 2. log 활용하기 

```bash
$ git log 
$ git log --oneline
$ git log -1
$ git log -1 --oneline 
$ git log --oneline --graph 

```

* head : 현재 작업하고 있는 커밋 이력 및 브랜치에 대한 포인터 

```bash
a26b82b (Head -> master) Add lee.txt
#나는 현재 master 브랜치에 있고 a26b82b 커밋이 상태에 있다. 
```

* 예시) 

```bash
$ git log -- oneline 
a26b82b (Head -> master) Add lee.txt
8ed4f94 (feature/signout) Complete signout 
97871d5 (origin/master) 집 - main.html

# 나는 master 브랜치에서 a26b82b 커밋을 했고 
# feature/signout 브랜치는 8ed4f94 이력이고,
# 원격저장소(origin/master)는 97871d5 이력이다. 
```

### 3. 직전 커밋 메시지 수정 

> 아래의 명령어는 커밋 이력을 변경하기 때문에 조심해야 한다. 
>
> 공개된 저장소에 (원격 저장소) 이미 push 된 이력이라면 절대 해서는 안된다. 

```bash
$ git log --oneline -1 #log 확인후 
$ git commit --amend #메시지창 팝업 
esc → : → w → q      #해당 키 입력
$ git log --oneline -1 #hash 값이 바뀐 것을 확인 
```

> 예시상황 ) 커밋시 특정 파일을 빠뜨렸을 때 
>
> 만약, staging area에 특정 파일(omit_file.txt) 을 올리지 않아서 커밋이 되지 않았을때,
>
> ```bash
> $ git add .
> $ git commit --amend 
> #commit 메시지 작성 후 저장 순간 사진이 찍힌다! 
> ```

## 4. staging area

* 커밋 이력이 있는 파일을 수정한 경우 

``` bash
$ git status 
On branch master #마스터 브랜치에 있다. 
Changes not staged for commit: #staged가 아닌 변경사항들
	# 선택지 제시(2가지) 
	#commit이 될 update를 위해서 → staged로 바꾸려면(첫번째)
  (use "git add <file>..." to update what will be committed)
  	# WD에 있는 변화를 버리러면(두번째)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   .txt          # 빨간 글자
        modified:   test2.txt	  # 빨간 글자  
no changes added to commit (use "git add" and/or "git commit -a")
# "git commit -a" : add 와 commit을 합친 명령어 


```

```bash
# 선택지만 명령어로 때서 표현하면
$ git add <file> 
$ git restore <file> #특정 commit 이후의 변경된 사항을 없애버림 
				  # git restore --staged <file>
                    # 구버전 git에서는 아래의 명령어를 사용해야 한다. 
                    # git checkout -- <file> 

```

* 커밋 이력이 없는파일을 수정한 경우 

```bash
$ git status 
on branch master 	
#커밋이 될 변화 
#커밋 명령어 했을 때, 아래의 내용이 이력에 남는다. 

changes to be committed 
	#만일 unstaged 하기 위하여(add이전으로 돌리러면)
	(use "git restore --staged <file>..." to unstage)
		modified:  .txt			#초록색 글자
		modified:  test2.txt	 # 초록색 글자 
		
		
		
		
student@M16043 MINGW64 ~/Desktop/멀캠/웹 (master)
$ git status
On branch master
# tracking 되고 잇찌 않는 파일 -> commit(이력)에 한번도 관리된적 없다 
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        jinsoo.txt
# 커밋할 것도 없고(staging area가 필요없고)
# 트래킹 되고 있지 않는 파일 
nothing added to commit but untracked files present (use "git add" to track)

```

```bash
# 추가 설명 : add 이력 취소하는법 
$ git restore --staged <file>
# 구버전때는 이렇게 했다. 
$ git read HEAD <file>
```

> WD → Staging area → Commits 의 Local Git Repository 절차를 상기하자! 



### Working directory 변화 삭제하기 

> git에서는 모든 commit 된 내용은 되돌릴 수 있다. 

> 다만, 상기의 WD 내용을 삭제하는 것은 되돌릴 수 가 없다.

```bash
$ git restore <file>
```

* 구버전 git 에서는 아래의 명령어를 사용해야 한다.

```bash
$ git checkout --<file>
```

### 5. stash

> Stash 는 변경사항을 임시로 저장 해놓은 공간이다. 
>
> Ex/ 상황조성 해보기 

```bash
1. feature branch 에서 a.txt를 변경 후 커밋 
2. master branch 에서 a.txt를 수정! (add나 commit 안한상태)
3. merge 
```

```bash
$ git merge test
# 현재 merge 명령어로 인해 아래의 덮어 쓰여질 수 있다. 
error: Your local changes to the following files would be overwritten by merge:
        a.txt
# commit을 하거나 이력 확정을 해서 merge 시 충돌 나는 상황으로 
# stash 해라 → working directory를 잠시 비워놓음. 
# commit 하기는 애매한 상황에서 stash 후 다시 불러옴
#(보통 실수인 상황에서는 commit 선택)
Please commit your changes or stash them before you merge.
Aborting
Updating fd23fa0..0a66c18


$ git stash #stash 공간에 저장
Saved working directory and index state WIP on master: fd23fa0 a.txt

student@M16043 MINGW64 ~/Desktop/stash (master)
$ git stash list #stash 공간에 내용 확인 
stash@{0}: WIP on master: fd23fa0 a.txt

student@M16043 MINGW64 ~/Desktop/stash (master)
$ git stash pop #stash 공간에서 적용(apply)하고 목록에서 삭제(drop) 하기
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt

no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (ef5e907a8bc0fdbecd751d9a6a207eb486ca125e)

```

```bash
student@M16043 MINGW64 ~/Desktop/stash (master)
$ git stash
Saved working directory and index state WIP on master: fd23fa0 a.txt

student@M16043 MINGW64 ~/Desktop/stash (master)
$ git status
On branch master
nothing to commit, working tree clean

student@M16043 MINGW64 ~/Desktop/stash (master)
$ git merge test
Updating fd23fa0..0a66c18
Fast-forward
 a.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

student@M16043 MINGW64 ~/Desktop/stash (master)
$ git stash pop
Auto-merging a.txt
CONFLICT (content): Merge conflict in a.txt
The stash entry is kept in case you need it again.

student@M16043 MINGW64 ~/Desktop/stash (master)

#충돌 해결 후 작업 이어나가기 

```

# reset VS revert

commit 이력을 되돌리는 역할을 한다.

```bash
# reset : 원하는 곳의 이력이후의 이력을 삭제함
#        저장소에 한번이라도 push를 했다면 사용하면 안됨.
설정 3가지
1. --mixed : 기본옵션, 해당 커밋이후 변경사항 staging area에 보관
2. --hard : 해당 커밋 이후 변경사항 모두삭제 **사용주의** 
3. --soft : 해당커밋이후 변경사항 및 working directory 내용까지 보관

$ git log --oneline
18ec9d2 (HEAD -> master) b.txt 파일 생성
8f4cc3c 둘중에 하나 선택
95cf122 (test) test branch에서 a.txt수정
7b7d49f Add a.txt
4258e9e a.txt .수정
2dba08a Add a.txt

student@M16044 MINGW64 ~/Desktop/stash-reset (master)
$ git reset 8f4cc3c

student@M16044 MINGW64 ~/Desktop/stash-reset (master)
$ git log --oneline
8f4cc3c (HEAD -> master) 둘중에 하나 선택
95cf122 (test) test branch에서 a.txt수정
7b7d49f Add a.txt
4258e9e a.txt .수정
2dba08a Add a.txt


# revert : 되돌렸다는 이력을 남긴다.
$ git log --oneline
b156f7c (HEAD -> master) b.txt 파일 생성
b58a017 Revert "a.txt .수정"
8f4cc3c 둘중에 하나 선택
95cf122 (test) test branch에서 a.txt수정
7b7d49f Add a.txt
4258e9e a.txt .수정
2dba08a Add a.txt

student@M16044 MINGW64 ~/Desktop/stash - revert (master)
$ git revert b58a017
[master ad7a431] Revert "Revert "a.txt .수정""
 1 file changed, 3 deletions(-)

student@M16044 MINGW64 ~/Desktop/stash - revert (master)
$ git log --oneline
ad7a431 (HEAD -> master) Revert "Revert "a.txt .수정""
b156f7c b.txt 파일 생성
b58a017 Revert "a.txt .수정"
8f4cc3c 둘중에 하나 선택
95cf122 (test) test branch에서 a.txt수정
7b7d49f Add a.txt
4258e9e a.txt .수정
2dba08a Add a.txt
```