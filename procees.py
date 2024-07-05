import os

# 定义目标目录
directory = './bytecode'

# 遍历目录中的所有文件
for filename in os.listdir(directory):
    # 检查文件是否以.code结尾
    if filename.endswith('.code'):
        # 构造旧文件名和新文件名
        old_path = os.path.join(directory, filename)
        new_filename = filename[:-5] + '.hex'  # 将.code替换为.hex
        new_path = os.path.join(directory, new_filename)
        
        # 重命名文件
        os.rename(old_path, new_path)
        print(f'Renamed: {filename} -> {new_filename}')

print("所有.code文件已重命名为.hex")
