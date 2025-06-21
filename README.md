# **Legal FIR Filing System**

This repository contains a system designed to assist in filing First Information Reports (FIRs) by leveraging advanced NLP techniques to process legal documents, retrieve relevant information, and generate informed responses.

## **Project Structure and Workflow**

The project is organized into several key steps, each handled by a dedicated Python notebook:

1. **01\_pdf\_to\_md.ipynb**: PDF to Markdown Conversion  
2. **02\_chunking.ipynb**: Markdown Chunking  
3. **03\_faiss-cpu.ipynb**: Vector Embeddings and FAISS Indexing  
4. **04\_saul\_finetune.ipynb**: Legal LLM Fine-tuning (Saul)  
5. **05\_legal-ease.ipynb**: FIR Generation

## **Detailed Component Descriptions**

### **01\_pdf\_to\_md.ipynb**

This notebook is responsible for converting the raw legal PDF document, specifically the "BNS original.pdf," into a structured Markdown format. This initial step is crucial for subsequent processing, as it transforms an unstructured PDF into a more machine-readable and parsable text format.

**Key Functionality:**

* Takes the "BNS original.pdf" legal document as input.  
* Converts the PDF content into Markdown using the llama-parse library.  
* The conversion process uses detailed parsing\_instruction to normalize headings, remove irrelevant metadata, refine bullet points, and properly format illustrations and explanations for clarity and consistency. An example of the desired cleaned snippet is provided in the instructions.  
* The parsed Markdown content is extracted from the LlamaParse output and saved to a file named BNS\_parsed.md.  
* Includes code to keep the Colab runtime alive.

### **02\_chunking.ipynb**

This notebook processes the Markdown file generated in the previous step (BNS\_parsed.md) and breaks it down into smaller, manageable "chunks." This chunking process is essential for efficient information retrieval and allows the system to work with relevant sections of the legal document rather than the entire corpus.

**Key Functionality:**

* Reads the BNS\_parsed.md file.  
* Defines a chunk\_legal\_document function that splits the text into chunks based on a regular expression pattern for section numbers (^\\d+\\.\\s+) and aims to keep chunks within a min\_length and max\_length.  
* Uses re and json libraries for text processing and data handling.  
* The processed chunks are stored in a dictionary with the key "BNS" and can be printed to verify the chunking.

### **03\_faiss-cpu.ipynb**

This notebook is responsible for creating numerical representations (vector embeddings) of the text chunks generated in the chunking phase. These embeddings capture the semantic meaning of the text, allowing for efficient similarity searches. The generated embeddings are then stored in a FAISS (Facebook AI Similarity Search) index, which enables rapid retrieval of the most relevant legal sections.

**Key Functionality:**

* Installs necessary libraries: faiss-cpu, sentence-transformers, rank\_bm25, transformers.  
* Loads pre-trained models from sentence-transformers (e.g., sentence-transformers/all-MiniLM-L6-v2) to generate embeddings.  
* Initializes a FAISS index (e.g., IndexFlatL2) and adds the generated embeddings to it.  
* This FAISS index is crucial for performing fast similarity searches to find relevant legal text chunks.

### **04\_saul\_finetune.ipynb**

This notebook focuses on fine-tuning a legal Large Language Model (LLM) named "Saul." The fine-tuning process involves training the LLM on a specific dataset of legal information, enhancing its understanding and generation capabilities within the legal domain. This specialized training allows the LLM to provide more accurate and contextually relevant responses for legal queries.

**Key Functionality:**

* Installs dependencies like transformers, datasets, peft, accelerate, and bitsandbytes.  
* Sets up a fine-tuning environment for a large language model.  
* It is designed to fine-tune a pre-trained model (likely a legal-specific variant or a general-purpose model adapted for legal tasks) on a custom legal dataset.  
* The fine-tuning process improves the model's ability to understand legal nuances and generate legally appropriate text.

### **05\_legal-ease.ipynb**

This is the culminating notebook that brings together all the previous components to achieve the primary goal: filing an FIR. It utilizes the vector embeddings and FAISS index to retrieve the most relevant legal sections based on a given query or scenario. These retrieved sections are then fed to the fine-tuned "Saul" LLM, which uses this information to generate a well-informed and legally sound FIR.

**Key Functionality:**

* Connects to the FAISS index built in 03\_faiss-cpu.ipynb to perform similarity searches.  
* Uses the fine-tuned "Saul" LLM from 04\_saul\_finetune.ipynb for text generation.  
* Retrieves the most relevant chunks of applicable legal sections based on a user's input or query related to an FIR.  
* Feeds these retrieved legal contexts to the LLM to generate a comprehensive and legally sound FIR, potentially including relevant sections and explanations from the BNS document.


## **License**

This project is licensed under the MIT License.

© 2024 Anmol Pokhriyal. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.