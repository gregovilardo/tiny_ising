import matplotlib.pyplot as plt
import pandas as pd

# Read the CSV file
try:
    df = pd.read_csv("icx.csv")
except FileNotFoundError:
    print("Error: File 'clang' not found. Please make sure the file exists.")
    exit()

df = df.groupby(["n_threads", "L_size"]).mean().reset_index()
print(df)


fig, ax1 = plt.subplots(1, 1, figsize=(14, 6))

for l_size in df["L_size"].unique():
    subset = df[df["L_size"] == l_size]
    ax1.plot(subset["n_threads"], subset["spins/ms"], marker="o", label=f"L={l_size}")

ax1.set_title("Performance vs Number of Threads")
ax1.set_xlabel("Number of Threads")
ax1.set_ylabel("Spins per millisecond")
ax1.grid(True)
ax1.legend()

# # Plot total_time vs n_threads for each L_size
# for l_size in df["L_size"].unique():
#     subset = df[df["L_size"] == l_size]
#     ax2.plot(subset["n_threads"], subset["total_time"], marker="o", label=f"L={l_size}")
#
# ax2.set_title("Total Time vs Number of Threads")
# ax2.set_xlabel("Number of Threads")
# ax2.set_ylabel("Total Time (ms)")
# ax2.grid(True)
# ax2.legend()

# plt.tight_layout()
plt.show()
