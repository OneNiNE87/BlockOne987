from inspect_safetensors import safe_open

# Open the file safely
with safe_open("your_file.safetensors", framework="pt") as f:
    # List all tensor keys
    keys = f.keys()
    print("Tensor keys:", keys)

    # Inspect metadata
    for key in keys:
        tensor = f.get_tensor(key)
        print(f"Key: {key}")
        print(f"Shape: {tensor.shape}")
        print(f"Dtype: {tensor.dtype}")
        print(f"First values: {tensor.flatten()[:5]}")
