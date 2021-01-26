use anyhow::Result;

mod logging;

fn main() -> Result<()> {
    logging::init()?;

    Ok(())
}
