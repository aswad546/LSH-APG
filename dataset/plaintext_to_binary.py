import os
import struct
import numpy as np

def convert_csv_to_binary(csv_file, output_file):
    data = np.loadtxt(csv_file, delimiter=',', dtype=np.float32)
    size, dimension = data.shape

    # Write the header to the binary file
    with open(output_file, 'wb') as bin_file:
        bin_file.write(struct.pack('i', 4))  # Bytes of the data type (int)
        bin_file.write(struct.pack('i', size))  # The size of the vectors (int)
        bin_file.write(struct.pack('i', dimension))  # The dimension of the vectors (int)
        
        # Write the binary vector
        bin_file.write(data.tobytes())

def convert_directory(input_directory, output_directory):
    # Create the output directory if it doesn't exist
    os.makedirs(output_directory, exist_ok=True)

    for filename in os.listdir(input_directory):
        if filename.endswith('.csv'):
            csv_file = os.path.join(input_directory, filename)
            output_file = os.path.join(output_directory, os.path.splitext(filename)[0] + '.data_new')
            convert_csv_to_binary(csv_file, output_file)
            print(f"Converted {csv_file} to {output_file}")

# Example usage
input_directory = './plaintext/keystroke/benign/train'
output_directory = './binary/keystroke/benign/train'
convert_directory(input_directory, output_directory)
