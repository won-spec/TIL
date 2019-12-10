## 1. 준비사항

* 로컬저장소(A-집)

  ```bash
  $ git clone 원격저장소 URL
  $ cd 해당 레파짓토리 이름
  ```

* 로컬저장소(B-멀캠)

## 2. 시나리오

0. 집에서 pull(원격저장소에서 받아오기)

1. 집에서 작업

```bash
$ touch a.txt
$ git add .
$ git commit -m 'a.txt추가'
```

2. 원격저장소로 push

```bash
$ git push origin master
```

3. 멀캠에서 pull (원격 저장소에서 받아오기)

```bash
$git pull origin master
```

4. 멀캠에서 작업

```bash
$ touch b.txt
$ git add .
$ git commit -m '멀캠작업'
```

5. 원격저장소 push

```bash
$ git push origin master
```

