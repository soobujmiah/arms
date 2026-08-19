# 15 — AI & Machine Learning

Run LLMs and AI locally on **arm64** — CPU-first, no GPU/cloud required. ✅

| Tool | Description | Install |
|------|-------------|---------|
| **Ollama** | Local LLM server (pull/run models like Docker images) | `curl -fsSL https://ollama.com/install.sh \| sh` |
| **llama.cpp** | CPU-first C++ inference framework (GGUF models) | `git clone https://github.com/ggml-org/llama.cpp && cmake -B build -DGGML_NATIVE=ON && cmake --build build --config Release -j$(nproc)` |
| **whisper.cpp** | Speech-to-text (OpenAI Whisper in C++) | `git clone https://github.com/ggml-org/whisper.cpp && make` |

### Usage examples

```bash
# Ollama
ollama pull llama3.2:3b
ollama run llama3.2:3b "Hello"
ollama serve           # API on http://localhost:11434

# llama.cpp (CPU-optimized build for ARMv8.2 / NEON)
cmake -B build -DGGML_NATIVE=ON -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS
./build/bin/llama-cli -m Qwen2.5-7B-Instruct-Q4_K_M.gguf -p "Hi"

# Raspberry Pi — compile with NEON SIMD
cmake -B build -DGGML_NEON=on -DGGML_NATIVE=ON
./build/bin/llama-cli -m model.gguf -ngl 0 -t 4 -p "Hello"
```

### Performance guidance (arm64 SBCs)

| Hardware | Sweet-spot models | Speed |
|----------|-------------------|-------|
| Raspberry Pi 5 (8GB) | Llama 3.2 1b–3b, Qwen2.5 1.5b | 2–8 tok/s |
| Raspberry Pi 4 (4/8GB) | 1b–3b models | ~half of Pi 5 |
| Rockchip RK3588 (RK1) | Qwen2.5 7b (Q4) | usable CPU inference (~8–15W/node) |

> NPU support (e.g. RK3588's 6 TOPS NPU) is still experimental for LLMs —
> mainstream tools run on CPU by default.

*License: MIT (Ollama/llama.cpp/whisper.cpp). Collector holds no rights.*
