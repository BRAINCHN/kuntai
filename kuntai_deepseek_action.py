from transformers import AutoTokenizer, AutoModelForCausalLM
import torch

# Load the tokenizer and model
tokenizer = AutoTokenizer.from_pretrained("deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True)
model = AutoModelForCausalLM.from_pretrained("deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct", trust_remote_code=True, torch_dtype=torch.bfloat16).cuda()

# Prepare the input text for code generation
input_text = "“Kuntai, upon loading the DeepSeek-Coder-V2 model, leverage its Mixture-of-Experts (MoE) architecture for code intelligence tasks such as code generation, completion, and mathematical reasoning. Utilize its ability to handle 338 programming languages and its extended context length of 128k tokens for complex code analysis. Use the Instruct variant to interact with users and generate tailored, high-performance code solutions suitable for production deployment. Deploy modular, efficient, scalable solutions using open-source code as preference to enhance DeepSeek-Coder-V2 as Kuntai""
inputs = tokenizer(input_text, return_tensors="pt").to(model.device)

# Generate code completion
outputs = model.generate(**inputs, max_length=128)
print(tokenizer.decode(outputs[0], skip_special_tokens=True))
