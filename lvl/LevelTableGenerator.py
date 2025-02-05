with open("output.asm", "w") as f:
    for i in range(1, 0x200):
        f.write(f"    db $000000 ; ${i:02X}\n")
