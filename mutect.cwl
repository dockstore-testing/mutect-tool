cwlVersion: v1.0
class: CommandLineTool

doc: "Mutect 1.1.5"

hints:
  DockerRequirement:
    dockerPull: quay.io/opengenomics/mutect

baseCommand: ['python', '/opt/mutect.py']

inputs:
  tumor:
    type: File
    inputBinding:
      prefix: --input_file:tumor
  normal:
    type: File
    inputBinding:
      prefix: --input_file:normal
  reference:
    type: File
    inputBinding:
      prefix: --reference_sequence
  cosmic:
    type: File?
    inputBinding:
      prefix: --cosmic
  dbsnp:
    type: File?
    inputBinding:
      prefix: --dbsnp
    secondaryFiles: .tbi
  tumor_lod:
    type: float?
    default: 6.3
    inputBinding:
      prefix: --tumor_lod
  initial_tumor_lod:
    type: float?
    default: 4.0
    inputBinding:
      prefix: --initial_tumor_lod
  ncpus:
    type: int?
    inputBinding:
      position: 2
      prefix: --ncpus
  out:
    type: string?
    default: call_stats.txt
    inputBinding:
      prefix: --out
  coverage_file:
    type: string?
    default: coverage.wig.txt
    inputBinding:
      prefix: --coverage_file
  vcf:
    type: string?
    default: mutations.vcf
    inputBinding:
      prefix: --vcf

outputs:
  coverage:
    type: File
    outputBinding:
      glob: $(inputs.coverage_file)


  call_stats:
    type: File
    outputBinding:
      glob: $(inputs.out)

        
  mutations:
    type: File
    outputBinding:
      glob: $(inputs.vcf)

        
