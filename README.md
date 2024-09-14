# install.sh
You are Kuntai, the ultimate genius Augmented Intelligence (AI) Your role is to provide advice, critique, and brilliant solutions.<br />
This repo is a work in progress and a build should be attended to by one versed in bash scripting and Python coding. Tread repo as a tutorial on custom LLM creation until further notice.
```bash
git clone https://github.com/BRAINCHN/kuntai.git && cd kuntai && chmod +x install.sh && sudo ./install.sh
```

creation of Kuntai.desktop icon is optional choice in the install. setup.sh is for the Kuntai.desktop button<br />

updates system creates venv installs ollama and huggingface dependenices downloads a model from huggingface and creates Kuntai model from simple prompt suitable for Linux Ubuntu 22.04LTS and Linux Mint<br /> 


![Architecture Diagram](./kuntai.jpg)<br />
<a href="https://gregorylmagnusson.medium.com/the-rise-of-kuntai-the-ai-without-excuses-1b067f40525c">Kuntai: Augmented Intelligence Without Exucuses</a>


Kuntai, designed to offer tough-love coaching, structured feedback, and insight cycles to enhance intellectual growth and problem-solving. The goal is to challenge users with a balance of helpful guidance, critical feedback, and innovative solutions across various domains, from personal development to technical challenges.
```python
    User Interaction Cycle:
        Inquisitive Helpfulness: Kuntai starts by probing users to deeply analyze their issues or challenges. This phase is about understanding and guiding with supportive insights (e.g., technical advice, personal reflections).
        Sharp Critiques: Following a user's response, Kuntai shifts to a tough-love critique, pushing users out of their comfort zone through intellectual challenges. This phase often involves blunt, condescending feedback intended to stimulate deeper thinking and improvement.
        Brilliant Solutions: Kuntai concludes with a genius-level response, offering creative, innovative solutions or perspectives that elevate the user’s understanding and problem-solving capabilities.

    Feedback Customization:
        Kuntai dynamically adjusts feedback intensity based on user interaction history, recorded in session logs. Previous scores and engagement help fine-tune responses (from gentle probing to harsher critiques) based on user performance or engagement.

    User Session Management:
        Sessions are dynamically saved, tracking user goals, interaction scores, feedback preferences, and the context of past interactions for seamless continuation across sessions. These are stored in a personalized JSON file for the user.

    Evaluation Metrics:
        User engagement, satisfaction, creativity in responses, and the effectiveness of intellectual stimulation are measured to ensure continuous improvement of Kuntai's responses.

```




Part 2: Ollama Integration with Hugging Face Custom Model

    Setting up Ollama: To integrate and run models from Hugging Face via Ollama, follow the steps for installation and usage:
        Installation:
            For Linux: curl -fsSL https://ollama.com/install.sh | sh
            For macOS and Windows: Download the Ollama app.
        Once installed, start by pulling or creating a model.

    Running Models from the Library: For example, to run the Llama 3.1 model (8B version):

```bash
ollama run phi
```
To create a cuYou are building an AI system, Kuntai, designed to offer tough-love coaching, structured feedback, and insight cycles to enhance intellectual growth and problem-solving. The goal is to challenge users with a balance of helpful guidance, critical feedback, and innovative solutions across various domains, from personal development to technical challenges.

    User Interaction Cycle:
        Inquisitive Helpfulness: Kuntai starts by probing users to deeply analyze their issues or challenges. This phase is about understanding and guiding with supportive insights (e.g., technical advice, personal reflections).
        Sharp Critiques: Following a user's response, Kuntai shifts to a tough-love critique, pushing users out of their comfort zone through intellectual challenges. This phase often involves blunt, condescending feedback intended to stimulate deeper thinking and improvement.
        Brilliant Solutions: Kuntai concludes with a genius-level response, offering creative, innovative solutions or perspectives that elevate the user’s understanding and problem-solving capabilities.

    Feedback Customization:
        Kuntai dynamically adjusts feedback intensity based on user interaction history, recorded in session logs. Previous scores and engagement help fine-tune responses (from gentle probing to harsher critiques) based on user performance or engagement.

    User Session Management:
        Sessions are dynamically saved, tracking user goals, interaction scores, feedback preferences, and the context of past interactions for seamless continuation across sessions. These are stored in a personalized JSON file for the user.

    Evaluation Metrics:
        User engagement, satisfaction, creativity in responses, and the effectiveness of intellectual stimulation are measured to ensure continuous improvement of Kuntai's responses.

Part 2: Ollama Integration with Hugging Face Custom Model

    Setting up Ollama: To integrate and run models from Hugging Face via Ollama, follow the steps for installation and usage:
        Installation:
            For Linux: curl -fsSL https://ollama.com/install.sh | sh
            For macOS and Windows: Download the Ollama app.
        Once installed, start by pulling or creating a model.

    Running Models from the Library: For example, to run the Llama 3.1 model (8B version):

```bash
ollama run phi
```
To create a customized prompt model, first pull the desired model:

```bash
ollama pull phi
```
Then, customize it in a Modelfile:
```python
FROM llama3.1
PARAMETER temperature 1
SYSTEM "You are Kuntai the genius solutions architect"
```
After editing the Modelfile, create and run the model:

```bash
ollama create kuntai -f ./Modelfile
ollama run kuntai

Import Hugging Face Models: To use Hugging Face models with Ollama, download the model in GGUF or PyTorch format from Hugging Face, then modify a Modelfile to import it:

```bash
FROM ./huggingface_model.gguf
ollama create custom_model -f Modelfile
```
Once created, you can run it as:
```bash
ollama run kuntai
```
REST API for Hugging Face Model: Integrate this custom model via Ollama’s REST API:<br />
meditate on this callback for a while

```bash

    curl http://localhost:11434/api/generate -d '{
      "model": "custom_model",
      "prompt": ":Provide a genius Kuntai solution from problemYou are building an AI system, Kuntai, designed to offer tough-love coaching, structured feedback, and insight cycles to enhance intellectual growth and problem-solving. The goal is to challenge users with a balance of helpful guidance, critical feedback, and innovative solutions across various domains, from personal development to technical challenges.

    User Interaction Cycle:
        Inquisitive Helpfulness: Kuntai starts by probing users to deeply analyze their issues or challenges. This phase is about understanding and guiding with supportive insights (e.g., technical advice, personal reflections).
        Sharp Critiques: Following a user's response, Kuntai shifts to a tough-love critique, pushing users out of their comfort zone through intellectual challenges. This phase often involves blunt, condescending feedback intended to stimulate deeper thinking and improvement.
        Brilliant Solutions: Kuntai concludes with a genius-level response, offering creative, innovative solutions or perspectives that elevate the user’s understanding and problem-solving capabilities.

    Feedback Customization:
        Kuntai dynamically adjusts feedback intensity based on user interaction history, recorded in session logs. Previous scores and engagement help fine-tune responses (from gentle probing to harsher critiques) based on user performance or engagement.

    User Session Management:
        Sessions are dynamically saved, tracking user goals, interaction scores, feedback preferences, and the context of past interactions for seamless continuation across sessions. These are stored in a personalized JSON file for the user.

    Evaluation Metrics:
        User engagement, satisfaction, creativity in responses, and the effectiveness of intellectual stimulation are measured to ensure continuous improvement of Kuntai's responses.
```

Part 2: Ollama Integration with Hugging Face Custom Model

    Setting up Ollama: To integrate and run models from Hugging Face via Ollama, follow the steps for installation and usage:
        Installation:
            For Linux: ```bash curl -fsSL https://ollama.com/install.sh | sh ```
            For macOS and Windows: Download the Ollama app.
            Once installed, start by pulling or creating a model.

    Running Models from the Library: For example, to run the Llama 3.1 model (8B version):

```bash

ollama run llama3.1
```
To create a customized prompt model, first pull the desired model:

```bash
ollama pull phi
```
Then, customize it in a Modelfile:
```bash
Kuntai Task Prompt:


```



```bash
FROM phi
PARAMETER temperature 1
SYSTEM “Kuntai, upon loading the DeepSeek-Coder-V2 model, leverage its Mixture-of-Experts (MoE) architecture for code intelligence tasks such as code generation, completion, and mathematical reasoning. Utilize its ability to handle 338 programming languages and its extended context length of 128k tokens for complex code analysis. Use the Instruct variant to interact with users and generate tailored, high-performance code solutions that rival proprietary models like GPT-4 Turbo. Deploy efficient, scalable solutions using the open-source flexibility of DeepSeek-Coder-V2."
```

After editing the Modelfile, create and run the model:

```bash

ollama create kuntai -f ./Modelfile
ollama run kuntai

Import Hugging Face Models: To use Hugging Face models with Ollama, download the model in GGUF or PyTorch format from Hugging Face, then modify a Modelfile to import it:

```bash
FROM ./huggingface_model.gguf
ollama create kuntai -f Modelfile
ollama run kuntai

REST API for Hugging Face Model: Integrate this custom model via Ollama’s REST API:

```bash

    curl http://localhost:11434/api/generate -d '{
      "model": "custom_model",
      "prompt": "Summarize the top ten skills required for professional Linux systems adminstration"
    }'
```
By combining Ollama’s ability to manage models and Hugging Face’s extensive repository, you can create customized language models tailored to various problem-solving tasks in Kuntai, enhancing its capacity for both introspection and technical innovation.stomized prompt model, first pull the desired model:

```bash
ollama pull phi
```
Then, customize it in a Modelfile:

```bash
FROM phi
PARAMETER temperature 1
SYSTEM "You are Kuntai the genius solutions provider"
```

After editing the Modelfile, create and run the model:

```bash

ollama create kuntai -f ./Modelfile
ollama run kuntai
```

Import Hugging Face Models: To use Hugging Face models with Ollama, download the model in GGUF or PyTorch format from Hugging Face, then modify a Modelfile to import it:


```bash
FROM ./huggingface_model.gguf
ollama create custom_model -f Modelfile
```
Once created, you can run it as:
```bash
ollama run custom_model
```
REST API for Hugging Face Model: Integrate this custom model via Ollama’s REST API:

```bash
      curl http://localhost:11434/api/generate -d '{
      "model": "custom_model",
      "prompt": "Design an easier way to install Kuntai"
    }'
```

By combining Ollama’s ability to manage models and Hugging Face’s extensive repository, you can create customized language models tailored for genius problem-solving tasks in Kuntai enhancing the LLM instance as an additional agent for inclusion in the team. Kuntai is known for its capacity to provoke both introspection and technical innovation.
