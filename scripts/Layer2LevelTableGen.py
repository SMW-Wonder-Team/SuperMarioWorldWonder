import tkinter as tk
from tkinter import filedialog

root = tk.Tk()
root.withdraw()  # Hide the root window

file_path = filedialog.asksaveasfilename(defaultextension=".txt", filetypes=[("Text files", "*.txt")])

if file_path:
    with open(file_path, "w") as file:
        for i in range(0x000, 0x200):  # 0x200 is 512 in decimal, covering 000 to 1FF
            file.write(f"   dl Level{format(i, '03X')}_L2\n")

    print(f"File '{file_path}' has been generated.")
