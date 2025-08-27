# JAVA SOURCE: GamePackageMover.java
#
# package com.psmreborn.nopsmdrm.noroot;
# import android.content.Context;
# import android.os.Environment;
# import android.util.Log;
# 
# import java.io.File;
# import java.io.FileInputStream;
# import java.io.FileOutputStream;
# import java.io.IOException;
# import java.io.InputStream;
# import java.io.OutputStream;
# 
# public class GamePackageMover {
#     private static void moveFolder(File src, File dest) throws IOException {
#         Log.d("MOVEFILES", src.getAbsolutePath() + "->" + dest.getAbsolutePath());
# 
#         if(src.isDirectory()){
#             if(!dest.exists()){
#                 dest.mkdir();
#             }
# 
#             String[] files = src.list();
# 
#             for (String file : files) {
#                 File srcFile = new File(src, file);
#                 File destFile = new File(dest, file);
# 
#                 moveFolder(srcFile,destFile);
#             }
# 
#         } else {
#             InputStream in = new FileInputStream(src);
#             OutputStream out = new FileOutputStream(dest);
# 
#             byte[] buffer = new byte[1024];
# 
#             int length;
#             while ((length = in.read(buffer)) > 0){
#                 out.write(buffer, 0, length);
#             }
# 
#             in.close();
#             out.close();
# 
#         }
# 
#         // delete original after.
#         src.delete();
#     }
#     public static void movePackages(Context ctx){
# 
#         File externalFilesDir = ctx.getExternalFilesDir(null);
#         File sdcard = Environment.getExternalStorageDirectory();
# 
#         File psmGamesFolder = new File(externalFilesDir, "psm");
#         File downloadPsmGamesFolder = new File(new File(sdcard, "psm"), "download");
# 
#         if(!downloadPsmGamesFolder.exists()) return;
#         if(!psmGamesFolder.exists()) psmGamesFolder.mkdirs();
# 
# 
#         for (File downloadedPsmGameFolder : downloadPsmGamesFolder.listFiles()) {
#             File newFile = new File(psmGamesFolder, downloadedPsmGameFolder.getName());
#             newFile.mkdirs();
#             Log.d("MOVEFILES", downloadedPsmGameFolder.getAbsolutePath() + "->" + newFile.getAbsolutePath());
# 
#             if (!downloadedPsmGameFolder.renameTo(newFile)) {
#                 try {
#                     moveFolder(downloadedPsmGameFolder, newFile);
#                 } catch (IOException e) {
#                     Log.d("MOVEFILES", "failed to move file: " + downloadPsmGamesFolder.getName());
#                 }
#             }
#         }
# 
#     }
# }
# 


.class public Lcom/psmreborn/nopsmdrm/noroot/GamePackageMover;
.super Ljava/lang/Object;
.source "GamePackageMover.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static moveFolder(Ljava/io/File;Ljava/io/File;)V
    .locals 6
    .param p0, "src"    # Ljava/io/File;
    .param p1, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MOVEFILES"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 18
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 19
    invoke-virtual {p1}, Ljava/io/File;->mkdir()Z

    .line 22
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 24
    .local v0, "files":[Ljava/lang/String;
    array-length v2, v0

    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 25
    .local v3, "file":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 26
    .local v4, "srcFile":Ljava/io/File;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 28
    .local v5, "destFile":Ljava/io/File;
    invoke-static {v4, v5}, Lcom/psmreborn/nopsmdrm/noroot/GamePackageMover;->moveFolder(Ljava/io/File;Ljava/io/File;)V

    .line 24
    .end local v3    # "file":Ljava/lang/String;
    .end local v4    # "srcFile":Ljava/io/File;
    .end local v5    # "destFile":Ljava/io/File;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 31
    .end local v0    # "files":[Ljava/lang/String;
    :cond_1
    goto :goto_2

    .line 32
    :cond_2
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 33
    .local v0, "in":Ljava/io/InputStream;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 35
    .local v2, "out":Ljava/io/OutputStream;
    const/16 v3, 0x400

    new-array v3, v3, [B

    .line 38
    .local v3, "buffer":[B
    :goto_1
    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    move v5, v4

    .local v5, "length":I
    if-lez v4, :cond_3

    .line 39
    invoke-virtual {v2, v3, v1, v5}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_1

    .line 42
    :cond_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 43
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    .line 48
    .end local v0    # "in":Ljava/io/InputStream;
    .end local v2    # "out":Ljava/io/OutputStream;
    .end local v3    # "buffer":[B
    .end local v5    # "length":I
    :goto_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 49
    return-void
.end method

.method public static movePackages(Landroid/content/Context;)V
    .locals 13
    .param p0, "ctx"    # Landroid/content/Context;

    .line 52
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 53
    .local v0, "externalFilesDir":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 55
    .local v1, "sdcard":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "psm"

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 56
    .local v2, "psmGamesFolder":Ljava/io/File;
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v3, "download"

    invoke-direct {v4, v5, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object v3, v4

    .line 58
    .local v3, "downloadPsmGamesFolder":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    return-void

    .line 59
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 62
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_3

    aget-object v7, v4, v6

    .line 63
    .local v7, "downloadedPsmGameFolder":Ljava/io/File;
    new-instance v8, Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v2, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 64
    .local v8, "newFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 65
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "->"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "MOVEFILES"

    invoke-static {v10, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    invoke-virtual {v7, v8}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 69
    :try_start_0
    invoke-static {v7, v8}, Lcom/psmreborn/nopsmdrm/noroot/GamePackageMover;->moveFolder(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    goto :goto_1

    .line 70
    :catch_0
    move-exception v9

    .line 71
    .local v9, "e":Ljava/io/IOException;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "failed to move file: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .end local v7    # "downloadedPsmGameFolder":Ljava/io/File;
    .end local v8    # "newFile":Ljava/io/File;
    .end local v9    # "e":Ljava/io/IOException;
    :cond_2
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 76
    :cond_3
    return-void
.end method
