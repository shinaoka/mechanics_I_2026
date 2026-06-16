"""第9週 大問2 模範解答用の図を生成する（教員用, 学生には配布しない）.

L = mu = T = 1 とすると v = sqrt(T/mu) = 1.
離散弦の固有角振動数 / 分散関係
    Omega(q) = 2 sqrt(k_N/m_N) |sin(qa/2)| = (2v/a) |sin(qa/2)|,  a = L/N
を N を変えて描き, 連続極限 Omega = v q への接近を見る.

実行: python3 make_figures.py
出力: dispersion_relation.png, eigenfrequencies.png
"""
import numpy as np
import matplotlib
matplotlib.rcParams["font.family"] = "Hiragino Sans"
matplotlib.rcParams["axes.unicode_minus"] = False
import matplotlib.pyplot as plt

L = 1.0
v = 1.0  # = sqrt(T/mu)
Ns = [4, 8, 16, 64]
colors = plt.cm.viridis(np.linspace(0.15, 0.85, len(Ns)))

# ---------- 図1: 分散関係 Omega(q)（ゾーン全体, N を変えて）----------
fig1, ax = plt.subplots(figsize=(6.4, 4.6))
for N, c in zip(Ns, colors):
    a = L / N
    q = np.linspace(0, np.pi / a, 400)              # 0 .. ブリルアンゾーン端
    Omega = (2 * v / a) * np.abs(np.sin(q * a / 2))
    ax.plot(q, Omega, color=c, lw=2, label=f"$N={N}$")
qline = np.linspace(0, 30, 200)
ax.plot(qline, v * qline, "k--", lw=1.3, label=r"連続体 $\Omega=vq$")
ax.set_xlabel(r"$q$")
ax.set_ylabel(r"$\Omega(q)$")
ax.set_xlim(0, 30)
ax.set_ylim(0, 35)
ax.set_title(r"分散関係: ゾーン端の「頭打ち」が $N$ とともに後退し連続極限へ")
ax.legend(fontsize=9, loc="upper left")
fig1.tight_layout()
fig1.savefig("dispersion_relation.png", dpi=140)

# ---------- 図2: 固有振動数 Omega_n vs q_n（離散モード）----------
fig2, ax = plt.subplots(figsize=(6.4, 4.6))
for N, c in zip(Ns, colors):
    a = L / N
    n = np.arange(1, N)                              # n = 1 .. N-1
    qn = n * np.pi / L
    Omega_n = (2 * v / a) * np.abs(np.sin(n * np.pi / (2 * N)))
    ax.plot(qn, Omega_n, "o-", color=c, ms=4, lw=1, label=f"$N={N}$")
qline = np.linspace(0, 30, 200)
ax.plot(qline, v * qline, "k--", lw=1.3, label=r"連続体 $\Omega=vq$")
ax.set_xlabel(r"$q_n=n\pi/L$")
ax.set_ylabel(r"$\Omega_n$")
ax.set_xlim(0, 30)
ax.set_ylim(0, 35)
ax.set_title(r"固有振動数: 低 $q$ で直線 $vq$ に一致, 高 $q$ でずれる")
ax.legend(fontsize=9, loc="upper left")
fig2.tight_layout()
fig2.savefig("eigenfrequencies.png", dpi=140)

print("saved dispersion_relation.png, eigenfrequencies.png")
