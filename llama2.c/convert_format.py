def remove_newlines(input_file, output_file):
    try:
        # 打开输入文件
        with open(input_file, 'r') as input_f:
            # 读取文件内容并去掉回车
            content = input_f.read().replace('\n', '')

            # 打开输出文件
            with open(output_file, 'w') as output_f:
                # 将去掉回车的内容写入到输出文件
                output_f.write(content)
                print("已保存去掉回车的内容到文件：", output_file)
    except FileNotFoundError:
        print("文件未找到！")


# 输入文件路径和输出文件路径
input_file_path = 'stories15M.txt'
output_file_path = 'stories15M_new.txt'

# 去掉回车并保存到文件
remove_newlines(input_file_path, output_file_path)
