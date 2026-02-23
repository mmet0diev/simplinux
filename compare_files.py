from sys import argv

try:
    file1 = open(argv[1], 'r').read()
    file2 = open(argv[2], 'r').read()

    if file1 == file2:
        print("Files are equal.")
    else:
        print("Not equal.")
    
except Exception as e:
    print(e)