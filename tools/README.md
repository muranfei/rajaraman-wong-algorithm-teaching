# 视频重新构建

项目包含最终视频、逐页幻灯片和旁白音频。若本机安装了 FFmpeg，可重新生成 MP4：

```powershell
powershell -ExecutionPolicy Bypass -File tools/build_video.ps1
```

脚本会读取 `tools/meta.json`，依次将 `slides/` 与 `audio/` 合成，再输出到 `media/Rajaraman_Wong_Algorithm_Teaching_Video.mp4`。

注意：重新编码所使用的 FFmpeg 版本和编码参数可能使输出文件哈希发生变化；画面和旁白内容应保持一致。
