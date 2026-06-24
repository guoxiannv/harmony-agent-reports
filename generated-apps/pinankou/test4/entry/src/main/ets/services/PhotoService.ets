export class PhotoService {
  async capture(): Promise<string> {
    // Stub: real implementation uses camera picker / AVPicker / permission flow.
    // Returns a deterministic placeholder for headless logic phase.
    return `memory://photo-${Date.now()}.jpg`
  }
}
