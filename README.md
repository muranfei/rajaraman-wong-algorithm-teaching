# Rajaraman and Wong Algorithm 教学项目

这是一个面向 VLSI 物理设计初学者的中文教学项目，用约 14 分钟讲清 Rajaraman and Wong 延迟导向聚类算法的问题定义、延迟模型、三个执行阶段和一个完整算例。

## 公开地址

- [GitHub 仓库](https://github.com/muranfei/rajaraman-wong-algorithm-teaching)
- [在线教学页面](https://muranfei.github.io/rajaraman-wong-algorithm-teaching/)

## 立即观看

- [播放教学视频](media/Rajaraman_Wong_Algorithm_Teaching_Video.mp4)
- [打开教学网页](index.html)
- [阅读配套讲义](docs/algorithm-notes.md)

## 视频内容

1. 算法定位：延迟导向聚类
2. 问题定义与节点复制
3. 节点延迟、簇内延迟与簇间延迟
4. DAG 与拓扑序回顾
5. 初始化、标记和聚类三个阶段的总体流程
6. 全对最大延迟矩阵与标签初始化
7. `l1`、`l2` 以及核心公式 `l(v) = max(l1, l2)`
8. 逆拓扑序聚类流程
9. 课件算例：从延迟矩阵到八个最终簇
10. 节点复制、算法性质与相关工作

## 成品信息

- 视频语言：普通话
- 画面：1920 x 1080，30 fps
- 时长：约 13 分 52 秒
- 编码：H.264 + AAC
- 媒体文件：`media/Rajaraman_Wong_Algorithm_Teaching_Video.mp4`

## 项目结构

```text
.
├── index.html
├── assets/
│   ├── cover.png
│   └── styles.css
├── data/
│   ├── chapters.js
│   └── chapters.json
├── docs/
│   ├── algorithm-notes.md
│   ├── narration.md
│   └── source-and-limitations.md
├── media/
│   └── Rajaraman_Wong_Algorithm_Teaching_Video.mp4
├── slides/
│   └── s01.png ... s19.png
└── tools/
    ├── build_video.ps1
    ├── meta.json
    └── README.md
```

## 本地预览

视频和教学网页均为静态文件，可以直接打开 `index.html`。如果浏览器限制本地文件读取，可在项目目录启动任意静态文件服务器。

## 来源与限制

教学内容依据课程课件 *EST8717 Lecture 5: Clustering* 中 Rajaraman and Wong Algorithm 部分整理。课件原文未随本项目重新分发。具体来源、内容边界和已知限制见 [source-and-limitations.md](docs/source-and-limitations.md)。

本项目以课程学习和教学展示为目的。课件来源内容的权利归原作者和课程提供方所有；如需公开复用，请先核对课程许可和署名要求。
